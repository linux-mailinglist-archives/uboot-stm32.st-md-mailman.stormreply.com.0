Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7CD398B09
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Jun 2021 15:50:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B05B7C57196;
	Wed,  2 Jun 2021 13:50:42 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6EB9C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1622641837;
 bh=X1j0pQgPKcmoKISTffE5XyWeThnr5N5KsGc9N3BeIuY=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=dNtm08Wap3njJliRwqLw0ibCYgcQpjiZXReTd5sFSnwIzB6ahfEHrQhGcRV+YxjYu
 qb7+ejpku8AacOj8aTQhF+07y1eqEUaOuJzEjkp5v0v8QjpOw/lDEUE02r0bovFVdL
 Lk+5lkSQOoY/gpINPeXbH8rXhWblZoDPCJvqQtk8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.70] ([62.143.247.63]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV67y-1lvgnz2g7S-00SAWK; Wed, 02
 Jun 2021 15:50:37 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210602101112.1.I43b836f3f20e75ae905f9b1e8d06c81a59d4eca6@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <bd035d13-4182-f513-6d3b-e58ac14d088c@gmx.de>
Date: Wed, 2 Jun 2021 15:50:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602101112.1.I43b836f3f20e75ae905f9b1e8d06c81a59d4eca6@changeid>
Content-Language: en-US
X-Provags-ID: V03:K1:x9flz5wbdgzdz0v8ZL+IOm9Dh/syPzauNdA7aZ4YrzAzkhoW9P3
 34Z5nahAhvzpbbTASuJ5ulxpV6LcaoGxLugUtJWr6t84iOZpe6n31NUx5JVaD/+1mwe7s27
 ZmDv1nDuWrHDGGNh2IwMML8M7K5EflIBwRDtAJmM531OdbWVPnl0A+Tv/snHhSisye/QVtH
 Fl7F7Ww0hr6oNJ0K7DNIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qs73ATctcNA=:2AQ/zbDynFbJR6dIc4zvAQ
 eOImbDewvHe/lw8qkZed4NTb4PZh2PUzo+n+zVwT8VYVGHYZORQkL/RzFb+jHJGLasbhsehoe
 UAoutt6iRqryCHUYDbXjKCi/5emjlke+HcsEb1s54DWRJbNR3qqYQf7SnX3Gjz8a6vB13bIiT
 5s7C1Nenc+f+M8nlmTsLANChUeVZLmCCgi9CA09EargDtU6EjQs6ewlB6gZjs+fTmdztlzoR+
 q4RGect3H/HBa5LbKU5jcplVKFODDI/iEjqROWSH5sJDR7aKroC3UAQapFIH544xFPsaPscie
 bgueuANxtsjesUmTQyrUiC82PQGxB0pFQ15LCmQp/Q0vBGPw7l0bLEV1ZnkAu6G9wPA3AVtzn
 v2Bf5ZX9gVtOGC+jBhUug2ftrxjN3ENHr2kfcUZldfURfb3hdQvy/irADumhUB0Uk9WxnkQwh
 rWB2xihx66REKorM8yVvuvth3ahDWAG6yZ5t/gs9ReHljDN+fF0rPTkC42L6TVibLKyL6fT/Q
 Jhsxo3aDYmvLEAWPnt/abJD8LXDjyvJXlTmItAKgj68l5dY2xis2tvjCUuDCFmZ7Sk5rRVc6k
 7T+rWP5a1R6nbvjV9fO3PDzS3G6BnggGADN53MlbGOFCw4CqoCymCe12qEeRPwApG2ABN8XML
 sbu8CJoibi9HGJF2P4yEBRoBya37IqQ1jeX6/spl3PJc4QT5xalSyE/71P9XqbE29rge/ECTa
 +5hNHYrK2Yh9QcEDYjsHOWF/d5gWcs0a9YM10EPUdcWY3TDafP5x/3qy/Ep9WAF4z8VWw5hRI
 XJwEOShpBo3RaxRAPEgQM7IwWd0VnpplQRJNWfPnHOm9YI+1Opa0gv1J/EWTy4/j6QSDEwJAW
 4XT7V5VUVQDx/jIF2hH926NaOWiVatbr9EdKVx1wllIZDhQdiFjZzT570KvzaoWt2BYlAOnvU
 S0vSiwcLsGHKz4nqzWzEWOHf1n1FOqLSw0xxTWVGGFn56YnDMfRoFhSBNQMBLDPPT6WrYHn1y
 bZbRDuQEx6i4TeTdVuRxa3yTRAcnH3RtQ4LNii+5jZZim0rhNGDQICM3bmRAmcsCbQw4ts7wL
 D77prGjDowdvwDH4r6O0LQuXnXbZLAMnjbS
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] doc: usage: reorder commands in index.rst
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

On 02.06.21 10:11, Patrick Delaunay wrote:
> Reorder alphabetically the command in the index of usage
> in U-Boot documentation.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

> ---
>
>  doc/usage/index.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/doc/usage/index.rst b/doc/usage/index.rst
> index c1f9b6a53b..41b247bc62 100644
> --- a/doc/usage/index.rst
> +++ b/doc/usage/index.rst
> @@ -34,12 +34,12 @@ Shell commands
>     load
>     loady
>     mbr
> -   mmc
>     md
> +   mmc
>     pstore
>     qfw
> +   reset
>     sbi
> +   scp03
>     size
>     true
> -   scp03
> -   reset
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
