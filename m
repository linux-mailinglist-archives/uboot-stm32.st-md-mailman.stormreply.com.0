Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA9661210
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jan 2023 23:40:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C42D7C69065;
	Sat,  7 Jan 2023 22:40:50 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B784C69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jan 2023 22:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1673131237; bh=/Lq0OkFnAWd7J/Erh2jLzEmHvVbALlxaDwLs0l4Ng8Q=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MCfSitmpg3tDzVnDzjRdNBG6y0xhVF1g2SKJ1q1e8hOXnV1TIWZ6jLL0FTSByvEhq
 ZssolE96+3eCSlqzeYA6CICf9K4+RjicwA9+b4d2dPsKpQ9R7NtYH6nLIB2dGzDjpw
 0zmgZo1OELRikcRQCRTLRJG6imczYN6gcEFkzo5ufdVh0MBOBfv2/wETT/Jrx5JLzz
 cGe7rbA/P174Kmp0+PfRQPEunU6oHxc84v4WGJ6U/jE7AlXJ1pnu0x/JhpP7cNM+EV
 1lYNw8XeaLCRNHLBMaTepEgfd5gBdeulfqknH7cvyWBgdCObJ9eAlfBsoqg+CGKOkT
 FX4t90+/No1JQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.94] ([88.152.145.137]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ3t-1pJO760MPF-00WIa2; Sat, 07
 Jan 2023 23:40:37 +0100
Message-ID: <b03e611b-2150-9bf9-0cb1-b15752ef9ae5@gmx.de>
Date: Sat, 7 Jan 2023 23:40:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-8-agraf@csgraf.de>
 <CAPnjgZ1uDNY4T65Q4EdW-xRnFiGhvWcCs=YtcwLCpRbZpTNJQg@mail.gmail.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <CAPnjgZ1uDNY4T65Q4EdW-xRnFiGhvWcCs=YtcwLCpRbZpTNJQg@mail.gmail.com>
X-Provags-ID: V03:K1:I2lrfiweUBLM7OAxavPTr5nzRh1M/k4Xdd9tXrW9ztuo6kG7BNv
 x7ni+CUY6jTa0S0gav4NueaGImStF30rgjtaRlLS5DeyBvx0iu9srRQZc3QZ/MmLwA2tfnO
 +XqpSib1jnk2j17BQsMUzd+Td4TgS0U6mBKq1cLeFYoRGruiXDQ+POGtMO5+sb7XlaiYOEW
 X4RvFH8uJ0pa0t9a2ME/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qmfUBjNtNa4=;HvNTNbvwDPHITU8SQr+nPUtY6PZ
 MLtqY+gSCGiHFxvnDaxxBIkeGe6hoEjlAj0v27tDVp3QgeJprfsiwbuWHlDdidUmcuJz/9Uqk
 Dn3LsyJRWsPqgZT0ZV+prm5tXoITioQtZgm89skbCeC11lVEb/kGTO5NuWoC5hs15JR30Dhqh
 yFRc70No9MmEhZYey9rMkW257jIpaZqk4im/WyxdIiWvyoRDQQr6vAikIpK+1ooHnwvZRTArt
 UuDb7Fv4pZC5QhwkDG/Q5x1K1UVAQ8VOk1w1coeSY1IJlRqbHmn6R2tOO0Mei35AJ8yhgw3Ds
 8UfCFWqGuC+Fx5P4CBRCeRBhLf2TH4wvAmyZEM2Lf6r6DMktUx205el08y9ROL3EYcOMhNjdF
 D940iv+0DkYyg8Gs3i1FVM5jy+k+oRzorWDZmHwgIv1b4j2SMEfKpRh8zYkGWb1qHpWgifDR9
 cSv5KZD8bQB9z+VLMkUeE8cj1orx67fakHJynVei4U2FOWouPkDMoUnyevtiI5yJeOAsKr2uh
 ex2aD3rwhS/71KztkrLVeNEUbukds0FfZH5Lv0h+/bVb9Xz7bEaoAXSoidPOfcGGEzjcwzF03
 VoIPjruZmoJcubbfKygYb+eDLtLs+wXjcyr2ca8dVqM4s9Nf1trSoqnOC8DsCzn2JEC2uNPbh
 WM1ZmHBwu3gSGpnCfOKhvu+axqpYN4x0OQ5l2nc1D8AE1i5Fso42hc6zET8CPQ7su8LTseXdI
 mwcsh+LaaYZD90O16IECO4MnQpzzwYjFeisEZDGaNAsqFAHc5v/e0Oavd4SvS1cHl+El6g3a5
 UJbkpQJqfjl9bMm6amTcZRhUSxkFrLNbJ/K04sjPuLO71myTBhN2feK+hsZEqPPNnAtjBhXaz
 5zYkRr5BsGd6SJ8fsPR1u1m1gAX2nL/U0kohDDv4w915kuLUq5OS+FMMpHfzFxI9MCp2+gn1V
 yXMjJs/Mn57ZqRxSKN8mVSY/w4w=
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Andre Przywara <andre.przywara@arm.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Alexander Graf <agraf@csgraf.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v4 7/9] video: Use VIDEO_DAMAGE for
	VIDEO_COPY
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 1/7/23 01:13, Simon Glass wrote:
> Hi Alexander,
>
> On Tue, 3 Jan 2023 at 14:50, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> CONFIG_VIDEO_COPY implemented a range based copying mechanism: If we
>
> range-based
>
>> print a single character, it will always copy the full range of bytes
>> from the top left corner of the character to the lower right onto the
>> uncached frame buffer. This includes pretty much the full line contents
>> of the printed character.
>>
>> Since we now have proper damage tracking, let's make use of that to reduce
>> the amount of data we need to copy. With this patch applied, we will only
>> copy the tiny rectangle surrounding characters when we print them,
>> speeding up the video console.
>>
>> As a bonus, we remove a lot of code.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>
>> ---
>>
>> v2 -> v3:
>>
>>    - Rebase
>>    - Make CONFIG_COPY always select VIDEO_DAMAGE
>> ---
>>   drivers/video/Kconfig             |  5 ++
>>   drivers/video/console_normal.c    | 14 +----
>>   drivers/video/console_rotate.c    | 37 ++-----------
>>   drivers/video/console_truetype.c  | 17 +-----
>>   drivers/video/vidconsole-uclass.c | 16 ------
>>   drivers/video/video-uclass.c      | 91 ++++++++-----------------------
>>   drivers/video/video_bmp.c         |  7 ---
>>   include/video.h                   | 37 -------------
>>   include/video_console.h           | 49 -----------------
>>   9 files changed, 37 insertions(+), 236 deletions(-)
>>
>
> This feature needs some tests in test/dm/video.c
>
> For sandbox, I think you will need to allow it to be enabled /
> disabled at runtime, so the some tests can use it and some not?

It should be good enough to enable the feature in one of the sandbox
defconfigs and disable it in another.

Best regards

Heinrich

>
> Regards,
> Simon

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
