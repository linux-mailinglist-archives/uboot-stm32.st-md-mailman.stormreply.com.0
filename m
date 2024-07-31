Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E32589425AF
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Jul 2024 07:16:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABCB1C6DD66;
	Wed, 31 Jul 2024 05:16:51 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E11E3C57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 05:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1722403000; x=1723007800; i=xypron.glpk@gmx.de;
 bh=F2XsOgdwQR62bO7pdFZsVn5uJpUR47W4tf3YcdssOgA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:Cc:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gT9TLIZnKPnqqa19KN8wZ/xm9ZDI+4CIHSBKB449DRQeVF7qS95o8Vhp9qyOhvY/
 0D6gq8kcl+iLVrUcXSa7x/xwtHQbuDRItlwjEcPunl5i51bgv0jkr1awjmcvrcBFX
 wUCSkmGW6jY0dxvgsKGg+UZ7bsT6BV82yD8qX2JKQ0sIw/iODTpozdID0aUIa1N9Q
 vXpEbFJ4lE+KVUScNfyQvYKZD2Dv+/9D4i3sNisR1Sc2MawFkXMJ3ivCpKaAozc0R
 ZyC2Ba2lTQGsqSAhYX3DYkjeVDzn/R6BaYsURx5dkAogSoAFQlnBSHpfoJgPh8GtS
 RK5/ivWgfT3A74XkkA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.161] ([62.143.93.80]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1Ycl-1sX61b2AGJ-00B8zu; Wed, 31
 Jul 2024 07:16:40 +0200
Message-ID: <4de5193f-194b-41e8-a064-be66246852bb@gmx.de>
Date: Wed, 31 Jul 2024 07:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Grzegorz Szymaszek <gszymaszek@short.pl>
References: <41ae952bf3f45545e3c6579463df3d0408f6343a.1722014005.git.gszymaszek@short.pl>
Content-Language: en-US
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <41ae952bf3f45545e3c6579463df3d0408f6343a.1722014005.git.gszymaszek@short.pl>
X-Provags-ID: V03:K1:Nt37t8pDjyN4ABE9RAPO4kX1nxv+A8NRBlKYnHPCgDKVrYQ/v5a
 tjBKFIFVq/jMA6oegmoQOObUNxpiSqLEpHx2fzEVbwsTnhI2S0tgwgbBJlgpWQImh3/SgYW
 c9gSHhvzfAB+u6u1ntJREXhXpI/T1le1hZC9RZVkig71+gP5tmdECbxwRdFUJ8OZPyhgLK2
 NyuRdTG6zKZweH1qJChSA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1xO4CSqoQdA=;Pliy5Z0QDDInhby+L/PCLInhwdL
 u3F7+HmAuAtDHT52IjFm9iaDkSSlOtnfS4IzN04FEBLuxD37i4sB1HU849fWn/Njzw1QJMscQ
 sBHyleyt36QyiUTOccyx3BxHmUsWKo6f/0SIlCGfrkeag04n4pnmsVY1kBESWzjLs34uRF34E
 PNRZ+X8XgSn20qXNd+izFKd6ya5biz5Xj7lKd19OIJgtTZnP3l/7j4G1OTD5yDGjcO89u58/2
 hldQLy5JFNIg2FbLBmfo0DbxEI90zujoPfdYBcABZSaloyXL9rUCUNK5v74b9DQKok/UscmQz
 DApYh5wYatxgqh3WSw4UEG0mY1XC1fMqHoMFx9wtjre4BOW11kxsUxZMbPUsM87V82Cz34aEw
 EexxHTEWnFRgk8yJ5FDIAL3fOu6PhJrClH0Uqt+0G2Iydtp2hZdv0EQ88qcy7/zLaxOOw7ZAL
 V97UnpU/rfJTyZRX+fBP1TebvcqUMkcewkiuILv3w9JWtO4hXOJV1FjLJU+HFtRZTcd8r9aES
 ugJUrTxHSDeF7c0BpHTTI0QRc+69Klswvy1z4AmjtA8qGPdzF7L4L4DXiUKHchxKsmfOPZ2Jn
 a3NoThJYRSjZyWfxuD2JsADhYIXcNAkeFWmbpjrOMG1HGhIL7R06VYfbe/WVKlgmGy6rPQVl3
 MIAsEtYn/oQY5JjiJNsoCEJutalQqghDLr36jRe9HB0HpX73UPyW8CIZnMYJVbYtmpHnqu3ve
 h6NysZsSii9SmW6snwaZGpHhdn9VoFYo9i9hBZEBke1n4mmRRtM6ERrllngNNTcDSBzKFmH2o
 YhgcyEpGFJ28OcKm5GfDCNZg==
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 1/3] doc: board: stm32mp1: add missing
	newline at EOF
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

On 7/26/24 19:17, Grzegorz Szymaszek wrote:

Please, provide a commit message explaining why you are making this change.

> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> ---
>   doc/board/st/stm32mp1.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
> index 63b44776ffc..239e18b5e17 100644
> --- a/doc/board/st/stm32mp1.rst
> +++ b/doc/board/st/stm32mp1.rst
> @@ -838,4 +838,4 @@ Arm TrustZone technology
>     + https://www.op-tee.org/
>     + https://optee.readthedocs.io/en/latest/
>     + https://optee.readthedocs.io/en/latest/building/devices/stm32mp1.html
> -  + https://github.com/OP-TEE/optee_os
> \ No newline at end of file
> +  + https://github.com/OP-TEE/optee_os

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
