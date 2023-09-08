Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA94C798E83
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Sep 2023 20:57:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A0DEC6B468;
	Fri,  8 Sep 2023 18:57:47 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBE92C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Sep 2023 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1694199463; x=1694804263; i=xypron.glpk@gmx.de;
 bh=iNnbhPqLA6RCxz2khvFoCdyX82g73MIIARDYGDJ0/0s=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=SiFaXqDS7S9z38q9YOgXdiZKYkfTK2Nm1+7VdqmTOegAlJwpzXzntwe3ZK5byKYwsV3i3Q/
 Tu6mGyPdZYSe4bP21nJXnQnoL2F7sSfBR/OSyvvIapOy8lreRtnyosDOTz6PuHDuFvoZDpM4A
 EzL0dEbhgjDBwVvPRFyz88NUdFlrZwXMVaOIpAvF3eBoO1zEfG097NIOYkKHyUeLpKNRnQLug
 3uMFtHySPoDh5eUQtXp1spahf7d+XK5j+9B1J8C8rhRRznLGazWOZBOxVMn9GhA91zTt5V21D
 WeS/4HwHvdrjeNlUiWmSqDaLNLFuhnFwp2mxZHeq3qlkKq1Nu/Gg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.94] ([178.202.40.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsJ5-1poEF60WcJ-00szA2; Fri, 08
 Sep 2023 20:57:43 +0200
Message-ID: <7cad48d4-7dd2-474d-b8cc-20de2e75e33b@gmx.de>
Date: Fri, 8 Sep 2023 20:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
References: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
 <20230907162200.205602-2-gatien.chevallier@foss.st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20230907162200.205602-2-gatien.chevallier@foss.st.com>
X-Provags-ID: V03:K1:DUwrK3OKCIpIasxNACSF2yHQ84K/HKkrQry3JMY/520PJToXLfZ
 /ofajsL4UbybE7+nwHXYhsarB9frH//NZhjMD5VXLLDa33E1HKSvOEfth1Bs+JkAjdD6OO6
 V+OhcoKICWaNVZ0mSYLoYAp6HioUDHs+tp/jxmG4X6ozDQ7y8+mRGWIwYAXOtOYr/hR/PUm
 sn1Q2ZxWfohn0KqWAIMsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pusSE8FCFY4=;3pSbsZOVWT6h8vpo+sWfvtExlxe
 UYicZA1i+X/EzT+htx+f8unxeuL0Pc+kdvCtFE1iHgK/xW6l9GJwvlonEtj6yR6wMNmkBOIDs
 HWZzDI3U7xAIx7IcdI7tRLytOIqDlW51Y1AR8lppCSyAYgbPrm6oEv/8fE4r/VQ7v74fvYmTf
 NjeLO+p8r4AB+YqQiKcwj+UQXAVX6voF8ATDba40VaSnhHRp+W4Qui5Dr98uqPkox6zxeKQ1Q
 HRqMD/aDK3TIqovBjV9OLUoOxbbnJyrqB1f4ofMWoFVXdKoqkuNDSa3VV7zNZMDi5EaJkHGxy
 NCfucKQeBqlCvWYImBs9ElIWmqb6vCKj3fzZkFsYP4h0q1z1f75ZgvgkkGHb9ZuxC4PqBtHUZ
 KxihVMnVv9xaO4FPkeJW/MgKChGmz9uGVXdmKHvwkcROqJaLEdutz2jss+9BSrMbnViPrqv7D
 SsJn87GqZh640HA62BzTMDvPWE4CVpc5Cw+wG0aXjXnAKqvMdsppfniafHmLt7XwsQDoJ04Yo
 rUkmxxdVxmHusQ8X4xot3mT/ZSmEG2L+Eyc/gMmMEExUMdSL+o3hY5Ma7Tit/P8i7ZHCAaX2p
 7inwV9b08eAJ0o+F+Gfhskh3CiUevyU7EmOj9WdePMB25AKAOk7iR8cXdmvSyMnQSnf4qwLah
 uii49dPEqvfjCV7ZTt6rq90F9a0L10gOH+T0bb2Nh5xb2oKfyaSNWHA2vGaDvgMDJzTXfpHms
 VbNdk/a9CYc53jy9FDABWZMovCvxy9D/K4FacWqHwJA2DtJjcifXPJWWd9RB4NWPRL7d3f6T3
 c0AdcfzRpzPnBu1AXMkWpHNrKIthk4VojsIZcKPEftipXRRT6n7rcIL7wB3RvcsRa5tLXWLWW
 hJYhve0Q5AG1AJz38bFPiOznTtvyDkilKYRoWBs7K4BR66PphbZDYB2vUX3Q9i46/e+uVuBb1
 bqN0kA0AZCXlWE6L+cSUSwqm/LI=
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 2/7] configs: default activate
 CONFIG_RNG_STM32 for STM32MP13x platforms
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

On 9/7/23 18:21, Gatien Chevallier wrote:
> Default embed this configuration. If OP-TEE PTA RNG is present as well,
> the priority will be given to it instead of the U-Boot driver.

Are you relying here on drivers being probed in alphabetical sequence?

Best regards

Heinrich

>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   configs/stm32mp13_defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index 82b62744f6..4a899c85de 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -65,6 +65,7 @@ CONFIG_DM_REGULATOR_GPIO=y
>   CONFIG_DM_REGULATOR_SCMI=y
>   CONFIG_RESET_SCMI=y
>   CONFIG_DM_RNG=y
> +CONFIG_RNG_STM32=y
>   CONFIG_DM_RTC=y
>   CONFIG_RTC_STM32=y
>   CONFIG_SERIAL_RX_BUFFER=y

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
