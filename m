Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF23A068E
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Jun 2021 00:04:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 801DAC57B78;
	Tue,  8 Jun 2021 22:04:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACFBAC57B75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 22:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623189862;
 bh=hTIlIs6H/KZB8QXTKI/qFa0ngjoFS+WEr0QrxWtCTMg=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=lajSD7mXcNVoi7kPvklmm6Uu6l3hBfX0r8W6rQlT3cDmN90OtPuKQy/3PTSE05j74
 TsrG9VlBSH6iOUJ/Gas5w5TogJzMIEiPEGYTJpD4AzNH/vIxURadX8iEBx1YC2IRvG
 Y2s14etgBMi6NLlhWBk6wcO/NfAzVCM0sNi1zSaM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([62.143.247.63]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKy8-1lxE3a2fea-00ShpM; Wed, 09
 Jun 2021 00:04:22 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210604165147.31788-1-patrick.delaunay@foss.st.com>
 <20210604185138.v2.1.I5e3a3276d6423b96b60bf2e60e6a57978c772154@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <76f13754-5a8d-2248-5d4b-b9a8c6a51f2d@gmx.de>
Date: Wed, 9 Jun 2021 00:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604185138.v2.1.I5e3a3276d6423b96b60bf2e60e6a57978c772154@changeid>
Content-Language: en-US
X-Provags-ID: V03:K1:zxs7CfL8TQdtHw+nCE0YvZhDEDiv4HOsE8XbFv47i9ZcThTHw1G
 /N2YCEgQ4dMLgZwU2abXIO62D2Q3fnVDrLAeqra8UMPMS8cEKuFgdpVP9cRzZXGpeaFbtO2
 AI1HVkGmhQiA9tHlvmWrqRYUOLnLmMUJZtAMhQ4oAgbkjFuLljEm94Tjg5fENgMOSvan9L0
 2z9P/3ufPBb59/IxFecWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:I5g79+tT1Mw=:34TPIu0BVnyDEvDsLW8Avs
 97PUqnaW5QSX+BZIdWO49nT2kWMGpu72Qd31bjqQSdQpBcu9C61g9AlcditCSv/AQ+zYg31GU
 45tJxgTWzh0HjHT47gFPLfSJnWKlJ2eJt/oeAoRqb6JS0PPH4EdcUBjleZHKZD1ySQEokMV+s
 VKojYRmfKIEQuh3L4EBEgKhMaN6wJ8CpgXXTOD8nKuw0UTGBr/8OjN9HLn1sVqqR4KV9ntI9J
 mWwezOIzbKG0C6Iy1KkK83hOmJV+UIVSmd9PzWLOjABqA2WTGnKcLESaHgymYGCtT2EGEqIX9
 875tY/o4CAa2mouKdISw7XDnXfU/s+oLYRMBdzlaYY/BUEY6j4QgOhMaD6TicSVZM3ACAu9Aj
 YriAbvi3+CGEMAkiq+m71yD8nBc+bzdJfANkYZqIj6prfckQzrJBjkGRObl8wsW1StlIG+tfJ
 5LzDj63iZfJJJr1ystUiotdESAcNiE0NH658pSYgKGIu4vUExeQw1t0Kod/l54InkNtcpGalJ
 8Eh/rKbLoxTYeHbmlXxjDP4f/nTbHagN8RPAOh6K6wDOjCW9j3BZFjJ8uKbwNFFD+kvFkLgsp
 VwxyNYX5GK2A50dqrkeTW+e2ZXROWdgc2XwNncZNuaB/Y/mNfAqcVSBNGJBUae+ZXCnF256jX
 r4q0Xws/bIF3AzjASjJQWScaGHPJ2rUcHVdUqiYY7v6gpGdZ3U1AptVUeYK+i7d/ncGoeXPB+
 BXzDFTpVIT3tYRtbMSATBk3bFhHTypl6++0rrg2BM6nu1hagOIMVgEIc9JliU/dH1eNG5hcvv
 b1Z4dSh0boS9dA+3kTLz35W5y4lh5cdVIfGPWJJEEdR92mRFdv6YZcvIM6tko1E5ike+I88RK
 5Mznv2B3zPjJCdZ5TydLe0SB1VfAQlcPD7frhNTGidLQCozxdW6LMwva/+wdvku5c8dqGXDwb
 pNZuc4vuHgWScE3rUhY8G32ms8ohsIHtpdS6nHPjpSSBqcMi3gzKGj8AqugcPC7m5eWporfyM
 STRkcvDNWoq3xC/VAS1H3V+ZqeREC4KubxnijBDsPPtDrgwPAbTc6I7eGNalgicFqAp1xsDD6
 uiNorCEcw5IJNA5ljlr3KNLvw0zt2oRe4gd
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Danis?= <frederic.danis@collabora.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Priyanka Jain <priyanka.jain@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] cmd: Add dependency for ums command
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

On 6/4/21 6:51 PM, Patrick Delaunay wrote:
> Add the missing dependency for the command ums:
> - CONFIG_BLK: call of blk_* functions in usb_mass_storage.c
> - CONFIG_USB_GADGET: required to select CONFIG_USB_FUNCTION_MASS_STORAGE
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

> ---
>
> Changes in v2:
> - NEW: Add dependency for ums command
>
>   cmd/Kconfig | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/cmd/Kconfig b/cmd/Kconfig
> index f962bb7141..a9fb4eead2 100644
> --- a/cmd/Kconfig
> +++ b/cmd/Kconfig
> @@ -1346,8 +1346,11 @@ config CMD_ROCKUSB
>   config CMD_USB_MASS_STORAGE
>   	bool "UMS usb mass storage"
>   	select USB_FUNCTION_MASS_STORAGE
> +	depends on BLK && USB_GADGET
>   	help
> -	  USB mass storage support
> +	  Enables the command "ums" and the USB mass storage support to the
> +	  export a block device: U-Boot, the USB device, acts as a simple
> +	  external hard drive plugged on the host USB port.
>
>   config CMD_PVBLOCK
>   	bool "Xen para-virtualized block device"
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
