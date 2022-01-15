Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F5048F616
	for <lists+uboot-stm32@lfdr.de>; Sat, 15 Jan 2022 10:19:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4E5FC60461;
	Sat, 15 Jan 2022 09:19:07 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8095FC5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jan 2022 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642238343;
 bh=o1ohIkwrAe0HiWeOv/TFwgsQvdTbarHN0TjplRSSnyY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KSE8BGXYj1roMZ/KDPX0BtrsKTXEKnMmpjVX7uFOHh6ph+tPMFszU+VGsjD851kx8
 xDSTMYimpLm8XqOa6lsUdLSjB4gaBwh52+Su9CqlOYYWsmx77om9pT/7gFZnrdZnn9
 n81beeYmrJ3WhPaQjA7RXrEzdz+9zmQnCbHbVgOw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.94] ([88.152.144.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59GA-1n9lfn340C-0019Ag; Sat, 15
 Jan 2022 10:19:03 +0100
Message-ID: <9b1462b8-03f8-a5d1-611d-d071675c2125@gmx.de>
Date: Sat, 15 Jan 2022 10:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
 <20220112105327.7.Iab4c78649bf9b7ec9692476312ef779b7a9655fb@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20220112105327.7.Iab4c78649bf9b7ec9692476312ef779b7a9655fb@changeid>
X-Provags-ID: V03:K1:eAg2CkTwvNqGMfr6pTHwWgYq1XY4IWtjkdI0Qox5DE4r9w+GLdt
 yToY8F7kxWDOkCluJ+W8I9Qz2amn/bw7qAOQyUgA3SmvE8WnzsSLDPP4FEdhXxj444Kb7vX
 /YFH+6DL4RpFAeyXM+zcb1vV/PwmB3w/e+F6/FpMlhnYdW4Q3wNzkSP60zKYkNVI1VUU7Ho
 0yh3BKoZ7l+fiIYx/RJrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rcV+bPsKHm8=:M5M4iBEPeU85zCLTsTmSBQ
 tZty1GHGrKGXz+r2MO2I7ywba8Dfi6mcxqVkua+5PZAe8+8UHa3aZxpEMGhrHEo8U2jaLa9GV
 lKt1H4repK9A/cxbBotSglW4QWYz9/ILhyTIYcstFqg2+2Mt/FJXiuKY4STM9jQYUWrYsUVS5
 EkGqSBBuzCWmXTD/XnwywF0BI0P1IQ2M7jdXTEpHXybSXGgniG6vN3Wl5LEQsV99Vp266mE/O
 zbySOxhpJuBVk10JIUcEiggSbePYHKYjFSgI97mTYUeXdVxr58xz2ZULe1abFu/DqrgedNDMD
 5KX8OWo2IHkWNyoKtRtsvuivn5vSfvPnmZyhkf87YfSNMoaC+huT1xl4eYPzIMLA+KQf7nWFH
 apBIE+/aRuam2Hy302KwhSfwsKSetQTcK/LGCnqw+0H81pgas2i/QNVbkEQGNqpcPV6MeDtQ5
 5vxe5rWyuyEkNZbbXj/ve+NgSb9vQ4TPd1KDVG5Rs5xFSR1cOkzBeqJquAX2EVnxYuO2KSkWz
 j/xmw6jtqalS1ieOkSOKOTvzuuA11LR6OtgUcIRIEfJfOaGIJKYFT+8svDANPJ5P00mb+Lrry
 QAe1F43iJVjdmX8Y0fnkUXMWoif9WIxqEmemD3rKaUK6u1eQpiF8OBETI+1/3eWbA00vmFmYU
 fiDofXNfl1L2Tb5rLm9Tgye9FYWL8mTXKNp3vgNtwhkFP9JN0LRy+sESLoBaPv8AOfo8VwhZP
 nUsn4jt9JLXhsBL+l5d+R+3DGvR62FQYAiOg3hAWsM2RkbV0Xe3jbjw7X49wk7e1dnqFUZB+O
 Yoq/G6lwLfISJFLORVIXkj6ShgJIALWWhkoaCrc9ovUWQxronD8Lx15qyGQbIxF1FFvjzuKcH
 KEYNGonC7uCTx8EdqV/Ia4JuD6LaUrTsWJyiPWzEfZNdrP7hoWAFKuqNiGvFlwKFOeaCWdaQZ
 tGn5z2srcmoqiSlAQoXPou+e2XOZhQvEPnti+POSSgh383eJlp//RCX/d+MzLRfuNPZZt136j
 lgJBmHQ5RDlOXoCTncGN7vdz/AXqHPqz13ZmX4KYTpEEtsJq1XtajY45aUx/lelVmGkEZeVCD
 xHt/99pxsefCgY=
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 7/9] doc: add include/dm/read.h to the
	HTML documentation
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

On 1/12/22 10:53, Patrick Delaunay wrote:
> Correct Sphinx style comments in include/dm/read.h
> and add the device read from device tree API to the HTML
> documentation.
>
> Signed-off-by: Patrick Delaunay<patrick.delaunay@foss.st.com>

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
