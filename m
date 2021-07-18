Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9FE3CC80F
	for <lists+uboot-stm32@lfdr.de>; Sun, 18 Jul 2021 09:29:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77AA2C597B0;
	Sun, 18 Jul 2021 07:29:57 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 953FACFAC5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jul 2021 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626593393;
 bh=0wf7NKpAlsIhYeHWT891FE/FuI0Z4lJoM4DhqcHGVk8=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=hOssm9DTUpq63JK/oadwf5NvFZ2c1DsaPBHzNS61UvIKvGsvK9s9ryLI+3zu9v0zz
 u6+k2EGN34L3FJuGAYo0Cv/dS4gGCFuzEnprfIA2iFjVgUCGyLyz8Y+XSnXDJyugMI
 FEZ0MAK84BezPB/SIq05DTAvDDyW4WNwho8NglvY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.189] ([88.152.144.157]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0FxV-1l9skZ487b-00xNVf; Sun, 18
 Jul 2021 09:29:53 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20210709124630.1.I212e7cd96724368b8272300c59c2a1c1f227ed67@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <212af40f-1ae4-007b-d577-9e6cd6e59bef@gmx.de>
Date: Sun, 18 Jul 2021 09:29:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709124630.1.I212e7cd96724368b8272300c59c2a1c1f227ed67@changeid>
Content-Language: en-US
X-Provags-ID: V03:K1:YZt/VhFfqllGnq3OjcVTreR4NpYNhOf+DZh/5Ej8l7Npv9V/NEI
 VY7RcgL9Y1+banKNQF4Ec8/1bzOHp2t6gc6+Xv2Ijf2v9109iaaNU3/jZRGIGmAjuTfQSWe
 Qs7RAiEtWfP5gx/T/w4OuSmEALyDXt0/FsDaJ0xim9/TwqsN7n/9vyJvbLKEGr4h/j7JJfk
 /1ziNCR+uls5q8UuOeiag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7sbJS8qv8nw=:lNKEkSHHpBrfGUu9+Sld8a
 zwDC1xxS4DaeSX6QqGZTv+Lb4ymmO1OtTHlXOUJI+yjFHFXs4j6jbPnXF4AXKQSVAvNkRp9x5
 aToi1BAFC66UL//yc6Txho6C6c4Vl7O0REJCZ0mhugZd1nOY5AkD1y0bC3NpAtGk4zQFfhleg
 hu7bNbaANXI0orY8kQ7uKrLJqtv+0rOB5EmEXxdLlS9J5w+nUrBp6sk7sGPucxeTN5hcXlVXv
 zkGOgEm7I/KKgFqJNvEKxAl4q/DaEmbU4D5+Cn/H6jVOZEXdheD5lXpq+vqvJpQvyQz6xmAtu
 UaMPKWmiP2hxYTaVYG6nK81VtYfXXLim3NZjsJkdC1gxTfHAtPIyvvQ2bkvPt+/gzqejOC1Bu
 qhitnv4kpbeHcIwX8IelZXGfxUgVPBXRG/En1UkFw0w5saub2KRJr9lkiHLl8UnWn+hkCYW4M
 5XQ6GiwkAf1h1kVSwS6vqXN9qlSvhVk4KyRIhyshP0KEVmkwrOAcWMZoRZSO2pXfs0Wbi6lEp
 OQLQcXO2TntS1OLAt4lCvixL8SBfhM/E9o4MpHwkG+cFK1+d9DahMnb7/w6FtOxay9NArFVfK
 TaQNj9OFMb393OjupHxRaquFE1xetd4EKpq18pumXDMcSQS7mzXDn4UXbxzAH+srFjKzzf1ZR
 PSiO6cP3EcLauV5AQpEf4RViw63Db6cJhSQOJGK1YEblfYxLTdBnCb4aD49/0O2u+1DtkTlX+
 miOcBbbBt5oYQZV+SgtvakCf6RJ5fcOelMUDw+TzXUGLC4WXv09rz4mgcmF+oUBVgsbpSAMxH
 Gz72uGaeTCxSpJLtco2cmJmjQJKmR8gtK3O68VY7MIF3NPJLnKwN55u6OOhdgFUbu0ACY+FeB
 pJk3X32po3fYHd3odLxZWwk3zftelLiomupamiIT7UdCYv637V474b3hjWeEhKxoyew+h1KYx
 N1aDVmLYX4N96tnEVRznp+fLTcRkCUP1EC2mvGxfFaxtmYbaig8Q4j/qe191fZENSh4mNngFi
 uKS5mI898EHx6VdQ0TKjfcn1dUCNa+eO3sxg9BYxW/AlpY1diMTm8QmKQF7dMz/BkPSrVRCKd
 dTabjGz089Hd4sEcjcgUj8PmW/wYhbuHpHd
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Alexander Graf <agraf@csgraf.de>
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: replace
 board_get_usable_ram_top by gd->ram_top
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



On 7/9/21 12:46 PM, Patrick Delaunay wrote:
> As gd->ram_top = board_get_usable_ram_top() in board_r
> the EFI loader don't need to call this function again and after relocation.
>
> This patch avoid issue if board assumed that this function is called
> only one time and before relocation.

Hello Patrick,

Which implementation of board_get_usable_ram_top() assumes that it is
called only once before relocation? Please, mention this in the commit
message.

gd->ram_top is set in multiple places:

arch/arm/mach-rockchip/spl.c:149:       gd->ram_top = gd->ram_base +
get_effective_memsize();
arch/arm/mach-rockchip/spl.c:150:       gd->ram_top =
board_get_usable_ram_top(gd->ram_size);
arch/arm/cpu/armv8/fsl-layerscape/spl.c:114:    gd->ram_top =
gd->bd->bi_dram[0].start + gd->bd->bi_dram[0].size;

I guess you refer to:

common/board_f.c:345:   gd->ram_top = gd->ram_base +
get_effective_memsize();
common/board_f.c:346:   gd->ram_top = board_get_usable_ram_top(gd->mon_len);

I would not expect board_get_usable_ram_top(gd->mon_len) and
board_get_usable_ram_top(0) to be the same. So, please, describe in your
patch why you assume that board_get_usable_ram_top(gd->mon_len) is the
value we should use.

Best regards

Heinrich

>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/7399
>
>
>   lib/efi_loader/efi_memory.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/lib/efi_loader/efi_memory.c b/lib/efi_loader/efi_memory.c
> index be2f655dff..f5bc37a20a 100644
> --- a/lib/efi_loader/efi_memory.c
> +++ b/lib/efi_loader/efi_memory.c
> @@ -7,7 +7,6 @@
>
>   #include <common.h>
>   #include <efi_loader.h>
> -#include <init.h>
>   #include <malloc.h>
>   #include <mapmem.h>
>   #include <watchdog.h>
> @@ -731,7 +730,7 @@ efi_status_t efi_add_conventional_memory_map(u64 ram_start, u64 ram_end,
>
>   __weak void efi_add_known_memory(void)
>   {
> -	u64 ram_top = board_get_usable_ram_top(0) & ~EFI_PAGE_MASK;
> +	u64 ram_top = gd->ram_top & ~EFI_PAGE_MASK;
>   	int i;
>
>   	/*
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
