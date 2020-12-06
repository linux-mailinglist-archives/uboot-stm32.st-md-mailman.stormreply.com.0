Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD80E2D0B3B
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Dec 2020 08:41:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69808C3FAD8;
	Mon,  7 Dec 2020 07:41:19 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15D16C36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Dec 2020 19:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607284734;
 bh=QRJ4LAAIqPHrhY5qOdNoN9M3Rl1MKZ/GoYBurdmXgrk=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=nVLCLWvC4ytxFz0R5PzaQmCw3ossvaw11d63Rvy0tR1myFQG82w0UW3ZBfdBf492f
 65S1pavsLySnWiCok4xmvXkYL4K/nW3Q5j+mSPDBOrNasPeHSa8qDWmKm6Addzhx86
 dGNEAn8y7y5w7TVsoswi5Ih57UoLOXJK8Osd2IEk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.27] ([77.191.130.91]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lo0ZA-1kF8GT3bCq-00fzbZ; Sun, 06
 Dec 2020 20:58:54 +0100
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20201203091549.7031-1-patrick.delaunay@st.com>
From: Soeren Moch <smoch@web.de>
Message-ID: <9d8e34fa-cd69-f2ac-7d63-0b2da2e382f5@web.de>
Date: Sun, 6 Dec 2020 20:58:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203091549.7031-1-patrick.delaunay@st.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:Spcfb3IGHnTY0lBtuK18ecpbznA0nNL9voflRnx2J+4+JGmASYx
 ratTOi7ojK/p03C6F0Ow9snfkn2iDNI3KbglqDK9S4RDWwYhDI0+7hA24Uy0Ny2JMNdQctB
 2ZenIFn0DtzNzgaemANYDWgXV9CbnV6dxzfUWBlg3n419WHJ6f11EmCEEDN0jMmvSca3jRe
 KnRuzMeFNQJ2HGidMnJUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pd5nBNoENi8=:aLclNehISktxBE7iu7vumS
 567C+oOdWUHYMEuani7n96gaCye5c95mzq1/zCYSfQ+p4S65qv+wvYaaVrNJBhggy0jABH6aI
 3xvCZROOw/7mnveeF4p7gIbARzy2t9dczXOZUP8ih99Cfcwguw3Lclh90DvVokuTLzYhmzGL0
 GLZCN2QIR0zs9F6LF0KULr7iy9snA3wdQ0hS1Pbfsi4HenTwEl/yNlLx/QwUw2vcdjV6ByaU5
 MIZqEM5SSn9giHisCMRZu4gyQ+bOoohFVqnH3Kx0UwG22nxEXPf89rwkM2XVXkSIU+j6R4B3i
 H2RzV2npCyy8Zs4CwM+yu/Oz6qcjDBC5rXACz2E6Q8va/HER8HBPGHpbr+XZERr6NcGiJ1GDJ
 w2wajskanPXr7pT8ofe2UqwpSS+bK3YcBISARTvnMLIibUATy80E+cyu8b0C3n97jaFgMKHWn
 I4vkEXF7yXn9ZqMH0YYQz39AntMObN5f4pmSmoSsoDGUBOdZ0kl7vzj5QWyX4kwqpGyYMFojC
 7uUjjs77Pa4XIDIQl7kuvzum2hF2BwY76fxweHCUm42V3z6JUI+MEoeorYRdJ8dsY4ft/77Dp
 DHowX+tUxnFjNEq7baesL7zFVMrYeLBnPERcNcNN4xMJ9JFajrcOyp1uZ5HTyWXMP2GAH7Orn
 zKJVKrf/3Bj5OVaElb5eSTvc3SXkpWNvUCCUbNSBahA3j386YPL06ze6pGXBC0LRsFC88qf9n
 pzZUAbKifn7Z2H3JsIyxwquQdpj9c+c/TIjEy+8Dv/VdZrKgJYiw5T8O7PbL7iFRC5U6fqQ1T
 d5pUbjLRfjsSqSfZU+xTqrpV27fHDsdCElAKule0F6H75l0KJUtA9wtPXm2Tmr+MGY1b69UiR
 foL4iIhVf5TzdGbasB2g==
X-Mailman-Approved-At: Mon, 07 Dec 2020 07:41:18 +0000
Cc: Tom Rini <trini@konsulko.com>, Akshay Saraswat <akshay.s@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 0/6] video: remove VIDCONSOLE_AS_LCD and
 VIDCONSOLE_AS_NAME
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 03.12.20 10:15, Patrick Delaunay wrote:
> I propose this serie to remove the vidconsole work-around, activated with
> the 2 options VIDCONSOLE_AS_LCD and VIDCONSOLE_AS_NAME and cleanup
> the associated code in console.c (under #ifdef CONFIG_VIDCONSOLE_AS_LCD)
>
> This options are now obsolete and they was planned to be
> removed around the end of 2020.
>
> I propose this patchset for v2021.04 even if I don't
> test this serie on real boards.
I really would like to keep this code for now.

On the tbs2910 board this workaround was introduced in the last u-boot
release (v2020.10), so there was almost no time for end users to notice
the warning and to update there environment. Not every end user installs
every new u-boot release, so we really should give more time for this
change.

This workaround is self-contained, small, easy to maintain, and strictly
opt-in. So this workaround hurts nobody, but removing this will let
users alone without any HDMI output. So on this board (without included
serial console port), this will result in unhappy users, especially
since without any console output there is no chance to get any idea what
is going wrong.

Thanks,
Soeren
>
> Patrick.
>
>
>
> Patrick Delaunay (6):
>   tbs2910: configs: remove VIDCONSOLE_AS_LCD
>   peach-pit: configs: remove VIDCONSOLE_AS_LCD
>   snow: configs: remove VIDCONSOLE_AS_LCD
>   peach-pi: configs: remove VIDCONSOLE_AS_LCD
>   spring: configs: remove VIDCONSOLE_AS_LCD
>   video: remove VIDCONSOLE_AS_LCD and VIDCONSOLE_AS_NAME
>
>  common/console.c            | 10 ----------
>  configs/peach-pi_defconfig  |  1 -
>  configs/peach-pit_defconfig |  1 -
>  configs/snow_defconfig      |  1 -
>  configs/spring_defconfig    |  1 -
>  configs/tbs2910_defconfig   |  1 -
>  drivers/video/Kconfig       | 22 ----------------------
>  7 files changed, 37 deletions(-)
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
