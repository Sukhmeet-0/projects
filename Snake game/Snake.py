import pygame
import random
import os

pygame.mixer.init()

pygame.init()


#colors 
white=(255,255,255)
red=(255,0,0)
black=(0,0,0)


screenWidth=900
screenHeight=600




#window
gameWindow=pygame.display.set_mode((screenWidth,screenHeight))
pygame.display.set_caption("Snake Game")
pygame.display.update()
clock=pygame.time.Clock()
font=pygame.font.SysFont(None,55)


def text_screen(text,color,x,y):
        screen_text=font.render(text,True,color)
        gameWindow.blit(screen_text,[x,y])

def plot_snake(gameWindow,color,snk_lst,snake_size):
    for x,y in snk_lst:
        pygame.draw.rect(gameWindow,black,[x,y,snake_size,snake_size])


def welcome():
    exit_game=False
    while not exit_game:
        gameWindow.fill((233,210,229))
        text_screen("welcome to Snakes",black,260,250)
        text_screen("Press Spacebar to Play",black,230,290)
        for event in pygame.event.get():
            if event.type==pygame.QUIT:
                exit_game=True
            if event.type==pygame.KEYDOWN:
                if event.key==pygame.K_SPACE:
                    pygame.mixer.music.load('back.wav')
                    pygame.mixer.music.play()
                    gameloop()
        pygame.display.update()
        clock.tick(60)


def gameloop():
#variables
    exit_game=False
    game_over=False
    snake_x=45
    snake_y=55
    snake_size=15
    velocity_x=0
    velocity_y=0
    score=0
    init_velocity=3
    food_x=random.randint(20,screenWidth/2)
    food_y=random.randint(30,screenHeight/2)



    if (not os.path.exists('hiscore.txt')):
        with open('hiscore.txt','w') as f:
            f.write('0')
    with open('hiscore.txt','r') as f:
        hiscore=f.read()

    
    snk_lst=[]
    snk_length=1

   
    #game loop
    while not exit_game:
        if game_over:
            with open('hiscore.txt','w') as f:
                f.write(str(hiscore))
            gameWindow.fill(white)
            text_screen("Game Over ! Press Enter to continue", red,100,250)
            for event in pygame.event.get():
                if event.type==pygame.QUIT:
                    exit_game=True
                if event.type==pygame.KEYDOWN:
                    if event.key==pygame.K_RETURN:
                        welcome()
        else:
            for event in pygame.event.get():
                if event.type==pygame.QUIT:
                    exit_game=True
                if event.type==pygame.KEYDOWN:
                    if event.key==pygame.K_q:
                        score+=5
                    if event.key == pygame.K_RIGHT:
                        # snake_x=snake_x+10
                        velocity_x=init_velocity
                        velocity_y=0
                    if event.key == pygame.K_LEFT:
                        velocity_x=-init_velocity
                        velocity_y=0
                    if event.key == pygame.K_UP:
                        velocity_y=-init_velocity
                        velocity_x=0
                    if event.key == pygame.K_DOWN:
                        velocity_y=init_velocity
                        velocity_x=0
            snake_x=snake_x+velocity_x
            snake_y=snake_y+velocity_y


            if abs(snake_x-food_x)<9 and abs(snake_y-food_y)<9:
                score+=10
                pygame.mixer.music.load('beep.wav')
                pygame.mixer.music.play()
                pygame.mixer.music.load('back.wav')
                pygame.mixer.music.play()
                food_x=random.randint(20,screenWidth/2)
                food_y=random.randint(30,screenHeight/2)
                snk_length+=5
                if score>int(hiscore):
                    hiscore=score

            gameWindow.fill(white)
            text_screen(f'Score: {score}  HiScore: {hiscore}',red,5,5)
            pygame.draw.rect(gameWindow,red,[food_x,food_y,snake_size,snake_size])

            head=[]
            head.append(snake_x)
            head.append(snake_y)
            snk_lst.append(head)
            if len(snk_lst)>snk_length:
                del snk_lst[0]
            if head in snk_lst[:-1]:
                game_over=True
                pygame.mixer.music.load('explosion.wav')
                pygame.mixer.music.play()
            if snake_x<0 or snake_x>screenWidth or snake_y<0 or snake_y>screenHeight:
                game_over=True
                pygame.mixer.music.load('explosion.wav')
                pygame.mixer.music.play()
            # pygame.draw.rect(gameWindow,black,[snake_x,snake_y,snake_size,snake_size])
            plot_snake(gameWindow,black,snk_lst,snake_size)
        pygame.display.update()
        clock.tick(60)
    pygame.quit()
    quit()
welcome()