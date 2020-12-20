Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4252DF6A5
	for <lists+uboot-stm32@lfdr.de>; Sun, 20 Dec 2020 20:28:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6BDDC5660F;
	Sun, 20 Dec 2020 19:28:53 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65C48C32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Dec 2020 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1608492523;
 bh=vQz/Ltk1GXCdDseB2gFd5GhMUmKomNyGrylSAbb0plI=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=RwUzSen5ycZ+NGlkD5OE7Q+eZnMUFZVD1VnttRfTUm2s9U6pdJt4VB3vTsCt40v0U
 NyV6rlqgFzgq3KgA+JsQ5TS4GuuNapodXtjhacsTO5R5AT8QjxrZjRi6eWsfhNkx8s
 LUeSnWqAmErypZGlzB0MQiw3yw++InJSEIGq3d8Y=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.27] ([89.14.189.32]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MPJya-1kmgfa3Y2a-004PjB; Sun, 20
 Dec 2020 20:28:43 +0100
To: Tom Rini <trini@konsulko.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
References: <20201203091549.7031-1-patrick.delaunay@st.com>
 <9d8e34fa-cd69-f2ac-7d63-0b2da2e382f5@web.de>
 <f0bd0043f95b4364bde19d21902e09bd@SFHDAG2NODE3.st.com>
 <27f75682-4527-ffeb-24d3-420e7ff3bd35@foss.st.com>
 <20201208161630.GP32272@bill-the-cat>
From: Soeren Moch <smoch@web.de>
Message-ID: <2cb8cd7b-4380-b1dd-4236-c85f0586d77a@web.de>
Date: Sun, 20 Dec 2020 20:28:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208161630.GP32272@bill-the-cat>
Content-Language: en-GB
X-Provags-ID: V03:K1:/8PdzTrZf85mKQgAeKawtjfbC0ch1ve7szx4LY41Ynx61OoKsmC
 xX5lLzxQJW5KWvYfLRMVjMjwXm/gw/2TqlDtP7OXOBhL2JLrRIJZ2evsPQGLc9WQd+zAGZB
 4s4FoqC+o6Mb59XPuGjyrvf53rKzo/odXAmf8sNnG1bKFEZAF+4xqV9T1Dtyb0q1ZHhprNN
 X9I1IR1EAnjLatFFOApXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P8DQrJ1fUi4=:9jFpsXEcU87HrcIGNPxKHO
 HCi8ozP2+BOLjZJctCnQmjWaVev3QV0zVsNpgqnEVzd+zXZUkSs1cBqD1cC7997ase2xLiIJz
 kfd0FS/NuBIf0NkVAVD0q0rDyaaT86acbn9VED/541dHAcFag0I8oTHIEKyiOXv1fQgs6t0xZ
 8DLJklxPVAQG/WbF01zHMYjtDFbiHoROpZZVT2q2upL8PKeL+Djx9dqxWMjONLX7G4kKEHe4X
 tDZLL06fhxvnUne4xBe5U75RnWnzsI+d26YHNRDYhe7EPNsfb7dZALV1UInMP54fpatR03dvP
 1Pdq3RHfR6ZQGnAmhHX9VYZzUS4zwX+JHkMSBKK0sHaSovMrQ8gNiEXXn5kRUr4h0BL2p5jRZ
 l1EYrJq3ci6GeYNxs1YP3/BYZ/GeIy3vQk7LMTTLdziY5j+f55KwCVZ6D8RBiPFYXqsuW0kIP
 Ocj1QlTvAICq9Kvij5lUloyr/ysefRS6UimwaLlG0DfvncwtLM110G0upFrMMMNL3ktilLr1O
 AfK/8YuyZNrh5c38ksKXKOPxbanLku/ebTbEwxHhobu1bgMlvgT3hjQbHK43JEq+rHE+h1WT1
 NN9cHed4KsdYS79Bsr5fT7zbt4JoFaE9LocNvbwhMsrgG8gJGcEKuEABRw/7TVlnvT7kBEn4x
 FDuROxcI2+UrmrxmNCWTNUo0zicPPamIaYPp2EBLdPoR/merN7zzdecav7NYuOqrf2isi3RWh
 +1aedMWuKXmxDla+ius3Y+RVbij4XOfI7BLZkEli83U2jXxzwCdYF3J8bjPi2orLhTZisPg6M
 LTmV1G+xsYy1G09L0mDO/9JU6Ya2yTu+BD9x3Mku1LIhKcKyxrGBdg8KrXwkM+yDVwPhFMpv3
 ashP/yP1C2/PltDro2gA==
Cc: Akshay Saraswat <akshay.s@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Yannick FERTRE <yannick.fertre@st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] FW: [PATCH 0/6] video: remove VIDCONSOLE_AS_LCD
 and VIDCONSOLE_AS_NAME
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 08.12.20 17:16, Tom Rini wrote:
> On Tue, Dec 08, 2020 at 03:30:43PM +0100, Patrick DELAUNAY wrote:
>> Hi Soeren,
>>
>>> From: Soeren Moch <smoch@web.de> Sent: dimanche 6 d=E9cembre 2020 20:59=
 On
>>> 03.12.20 10:15, Patrick Delaunay wrote:
>>>
>>>> I propose this serie to remove the vidconsole work-around, activated
>>>> with the 2 options VIDCONSOLE_AS_LCD and VIDCONSOLE_AS_NAME and
>>>> cleanup the associated code in console.c (under #ifdef
>>>> CONFIG_VIDCONSOLE_AS_LCD) This options are now obsolete and they was
>>>> planned to be removed around the end of 2020. I propose this
>>>> patchset for v2021.04 even if I don't test this serie on real
>>>> boards.
>>>>
>>> I really would like to keep this code for now.
>>>
>> I propose to remove these options because they are indicated obsolete in=
 the
>> config description
>>
>> in drivers/video/Kconfig (I see it during code review):
>>
>> "This option will be removed around the end of 2020"
>>
>> But I have no issue to kept it.
>>
>>> On the tbs2910 board this workaround was introduced in the last u-boot
>>> release (v2020.10), so there was almost no time for end users to notice
>>> the warning and to update there environment. Not every end user installs
>>> every new u-boot release, so we really should give more time for this
>>> change.
>>>
>> I agree that for your project, with migration to DM_VIDEO it is a really
>> short notice.
>>
>> =A0=A0=A0 commit 645d39aea367064868dcdd30c411806f4403b67b
>>
>> =A0=A0=A0 board: tbs2910: Fix video output with existing environments
>>
>> =3D> only integrated in v2020.10-rc2, sorry to miss it
>>
>>> This workaround is self-contained, small, easy to maintain, and strictly
>>> opt-in. So this workaround hurts nobody, but removing this will let
>>> users alone without any HDMI output. So on this board (without included
>>> serial console port), this will result in unhappy users, especially
>>> since without any console output there is no chance to get any idea what
>>> is going wrong.
>>>
>> Initially, I proposed this patch to cleanup the console.c code with 2 ot=
her
>> series:
>>
>> 1) http://patchwork.ozlabs.org/project/uboot/list/?series=3D218309
>>
>> =A0=A0=A0 "console: remove #ifdef CONFIG when it is possible"
>>
>> 2) http://patchwork.ozlabs.org/project/uboot/list/?series=3D218089
>>
>> =A0=A0=A0 "console: cosmetics: remove #if 0"
>>
>>
>> And I just want just to remove the remaining "#ifdef CONFIG_...."=A0 in
>> console.c
>>
>>
>> But I agree that I need to change my proposal to remove this workaround =
code
>>
>> (it is only use to help the DM VIDEO migration for existing board)
>>
>> and change the release target.
>>
>>
>> I propose to :
>>
>> - remove patch 1/6 of the serie for your board
>>
>> - no more remove the options in 6/6 but add warning in Makefile when the
>> option is activated
>>
>> =A0 and change target in config desciption
>>
>>
>> ifeq ($(CONFIG_VIDCONSOLE_AS_LCD),y)
>> =A0=A0=A0 @echo >&2 "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D WARNING =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D"
>> =A0=A0=A0 @echo >&2 "This board does use CONFIG_VIDCONSOLE_AS_LCD workar=
ound."
>> =A0=A0=A0 @echo >&2 "Please update the existing user defined environment=
s before "
>> =A0=A0=A0 @echo >&2 "v2022.01 release."
>> =A0=A0=A0 @echo >&2 "Failure to update by the deadline may result in vid=
eo
>> console"
>>
>> @echo >&2 "issue when this woarkaround will be removed."
>> =A0=A0=A0 @echo >&2 "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
>> endif
>>
>> =3D> open point: which acceptable target to remove this feature ? v2022.=
01 ?
> This sounds like a good plan and reasonable date to me.  Anatolij?
> Thanks!
>
Probably board users will not pay much attention to the build warning,
hopefully more to the console output warning.
Nevertheless, the proposed plan sounds like a good idea to me.

Thanks,
Soeren

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
