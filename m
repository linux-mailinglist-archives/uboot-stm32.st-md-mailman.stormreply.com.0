Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6452D0B3C
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Dec 2020 08:41:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 741EAC3FADB;
	Mon,  7 Dec 2020 07:41:19 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89A9EC36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Dec 2020 19:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607284778;
 bh=cZHVgbg3fEONf21Ajj8lWQDlh6MDsdnm9uemiyRlKh0=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=pFv43xz7JhsVlmAkQtypY5LflZl4cP7EqttIX2GtdH38f+e0KAosdU3nkCw/Bnyce
 /cxkusk6ppAslEunpnYutC2qFOsN23YeaTm7OZTm5nnZBWyxu2EIvTgBZtlQIiNW0n
 NC6t0D4CXEEqsxY5DzyXKPmOU8/+7i25XvQIuH9U=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.27] ([77.191.130.91]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBB80-1ks0zn3A8k-00CkD2; Sun, 06
 Dec 2020 20:59:37 +0100
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20201203091549.7031-1-patrick.delaunay@st.com>
 <20201203101538.1.I3813d938e14b844437a4ed6addf3280d064b28fd@changeid>
From: Soeren Moch <smoch@web.de>
Message-ID: <5d297b38-5603-07e6-af78-fb2594f52a79@web.de>
Date: Sun, 6 Dec 2020 20:59:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203101538.1.I3813d938e14b844437a4ed6addf3280d064b28fd@changeid>
Content-Language: en-GB
X-Provags-ID: V03:K1:uwuDMp3av2J8pn6Giu6LSaSYg/Ub70391L8dYYIRn5JhXJcs0lz
 fPI1mLkA50nnT55jnbwAiy5KDZnfKXV3JEJ1B7QDqhck3F+ujLMZX9vglFPzEV5HqEZgZjE
 PrVvXzC3iag3sKYjwM91//Za7jdVFcwhkBEfNuIQqYzojrqJxhyI30kvxt9UUlLQwQs943S
 ECjFfxhByzhAj5Q9/5TfA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ne7MYebX9xw=:2aqMYSG9tvP+SuG+Lw8F0E
 pNiYJpr1vy6nb5KC3xAwUrvj1jMlHLkFAbGcGY/Lmu8em4YmBylr+T1vSvkUqDgk52S3vzJ5Z
 oKXYQxgbz/OJiMudtqc+fRH9Liq5gSMpoPZRboszWvsY5bHFwCUDZdzi8T43LeumxTPFXkWme
 x/H/x8aUxDArtHzyX9K3MrMw+3qp+k3gKyfC2gD+P8Gk+C4iGGkCE0Qam6c7SDtUF4J5i1nEu
 UM1P9DQeSZqBACEADaNkH/Diz2/Xxl0TZ8OsvGtotmapHWyyPh+J/r+fsMiLFUap4h9EQZxB4
 51wXatXyZ/eyPBVQwen/sLe1emKORM8J8fDQSAtTzXT6+ws/7wEWCNZY93wQ60sEZ/NpDowZY
 Q6FsLtn7ggxTeOoNYjP5zfLCVzofiTuEa6lQ3AVDNF6dXcmTYQKG+YNtuAc8wXNi+OYAqGk2r
 DPU/FCpP1sot0PUosqICdLE24FeSVKverqAu+YuHITvCUFV89HOyXCFh+XBa+586QgZfDDZNU
 DchYBxOGrNSfDnxELHD8UxlW9sP0xIBOQVzqVxoRlLGbK+DbDEzARPx1xMs/HSz+4i4et+NUa
 X22gVnOvVuJqhUZuWiLhtZl7ynwUskwXLryH1BUTcqWaDkriT14Qq54OTH1l1YCCsZW4zzpjO
 dF7sOkSHSyd5LP+af9LMDq9mdvdhLrIJaen/OqAXh/7K7HersIpcqPA6IEOTH9gkY7ep8qrJO
 RvDDk6c4SC4ajmuaLYi3Qd9Mr64PkNMHZ+Sf6fmcfRyHbcHQqXkv0/Ye2hBrj+IBJmA1igEhj
 LVyRjjhvaP1sk343LBcQK+dHcbNCwdpzPin9kYZUaRJQa0C6J9b/yB9q9B3aEdm33//AzI99J
 X5R1lomtEHKKwFnfpQ2w==
X-Mailman-Approved-At: Mon, 07 Dec 2020 07:41:18 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] tbs2910: configs: remove
	VIDCONSOLE_AS_LCD
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
> Remove the obsolete CONFIG_VIDCONSOLE_AS_LCD as vidconsole is used in
> ./include/configs/tbs2910.h since commit 513acd04452f ("tbs2910: migrate
> to DM_VIDEO").
I don't consider this workaround as obsolete, please see my response to
the cover letter of this series. [1]

So please do not remove this code.

Thanks,
Soeren

[1] https://lists.denx.de/pipermail/u-boot/2020-December/434239.html
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/tbs2910_defconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/configs/tbs2910_defconfig b/configs/tbs2910_defconfig
> index e43fab208d..b5580abbfd 100644
> --- a/configs/tbs2910_defconfig
> +++ b/configs/tbs2910_defconfig
> @@ -103,7 +103,6 @@ CONFIG_DM_VIDEO=y
>  # CONFIG_VIDEO_ANSI is not set
>  CONFIG_SYS_WHITE_ON_BLACK=y
>  # CONFIG_PANEL is not set
> -CONFIG_VIDCONSOLE_AS_LCD=y
>  CONFIG_I2C_EDID=y
>  CONFIG_VIDEO_IPUV3=y
>  CONFIG_VIDEO_BMP_RLE8=y

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
