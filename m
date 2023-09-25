Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D527ADCBC
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Sep 2023 18:08:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AC4EC6B462;
	Mon, 25 Sep 2023 16:08:44 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8113AC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Sep 2023 16:08:43 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-50300cb4776so11112656e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Sep 2023 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695658122; x=1696262922;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IybnYXd156HSmumk6fJUDh8F/Z9ax94GJf50euhTh9Y=;
 b=Gu/gliLsdZJUAUC9JUj7e9tHqDxxWeac95+QkP3skj3rmxd1HHWMO2xJ+qj8Z/sJgG
 AT9nVM4n9J5gxb/ohNQcT5Xbvm3mR7bg5Fp7Rdhd4BxKmUQ9Ud/ZoqOstUsYlP4hRAbX
 wDynmc8Qz7QN2IP2cNaBmxDm/U/mK+ftUHF7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695658122; x=1696262922;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IybnYXd156HSmumk6fJUDh8F/Z9ax94GJf50euhTh9Y=;
 b=bBVsYNC9bbtXW7zonOHR8ELkQhbhN3a481nBKCScpQK13vpKQfXY7Nuo48baPGltqY
 wFbj+yfgnwvn0c4YcAVNDG/nNE9w/2LnZML8ThycNIFenwto72bX+or6W+/+6sUkaXWz
 Eh2QGMcVHcUS46s24qeUuFbyRCjmTrpNg9KTo97vY9UmARmOZjTYat9j9xSjV5unBEoP
 RzhnkUbH49pTeRH022uR451HsRddqRU6ZtPHpvyp304WEwipdZveVtu5Bz9yVsV8GYxj
 UHM30iRrnxDaXONsB3Whj8DreYrXyW4kvD92j86XHtpMh8vEiK6iPhQ5kZYS0IgVor65
 pfyw==
X-Gm-Message-State: AOJu0YwkzDhaFdHjqNuKGP8Rt0g5EFVWtrLRR8Exbo62p/wWvNdNFTtX
 XVVnXwqwgOfk8JvP3rN+LDX93a4JEVirzKF1tZsJ/A==
X-Google-Smtp-Source: AGHT+IF6XZJBX48ZIm0R0B+9MvNN82mcPjnwofy8MNsD0guNG5ReBnBhNa6TEyTNsXT0OUd/J8sX/uwNqoAEMxijcPs=
X-Received: by 2002:a05:6512:488e:b0:502:ffff:feff with SMTP id
 eq14-20020a056512488e00b00502fffffeffmr5267062lfb.58.1695658122258; Mon, 25
 Sep 2023 09:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230924192536.1812799-1-sjg@chromium.org>
 <20230924192536.1812799-2-sjg@chromium.org>
 <2a727cd4-bbda-409e-8d0e-1aafba182873@ltec.ch>
In-Reply-To: <2a727cd4-bbda-409e-8d0e-1aafba182873@ltec.ch>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 25 Sep 2023 10:08:30 -0600
Message-ID: <CAPnjgZ1a9hjodoEuYFuM9x+tiSZkL05_daJA4Rd5fzdwJ5KPMQ@mail.gmail.com>
To: Felix Brack <fb@ltec.ch>
Cc: Fabio Estevam <festevam@denx.de>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Chin-Liang See <clsee@altera.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Heiko Thiery <heiko.thiery@gmail.com>, Stefan Roese <sr@denx.de>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Uri Mashiach <uri.mashiach@compulab.co.il>, Peter.Chubb@data61.csiro.au,
 Michal Simek <michal.simek@amd.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Ian Ray <ian.ray@ge.com>,
 =?UTF-8?Q?Javier_Mart=C3=ADnez_Canillas?= <javier@dowhile0.org>,
 Tim Harvey <tharvey@gateworks.com>,
 Parthiban Nallathambi <parthiban@linumiz.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Alison Wang <alison.wang@nxp.com>, Philip Oberfichtner <pro@denx.de>,
 Green Wan <green.wan@sifive.com>, Roger Quadros <rogerq@kernel.org>,
 Allen Martin <amartin@nvidia.com>,
 Raffaele RECALCATI <raffaele.recalcati@bticino.it>,
 Paul Walmsley <paul.walmsley@sifive.com>, Teresa Remmet <t.remmet@phytec.de>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Adam Ford <aford173@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, kernel@puri.sm,
 Dave Gerlach <d-gerlach@ti.com>, Martyn Welch <martyn.welch@collabora.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Tianrui Wei <tianrui-wei@outlook.com>
Subject: Re: [Uboot-stm32] [PATCH v3 01/38] spl: Use CONFIG_SPL... instead
	of CONFIG_..._SPL_...
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

Hi Felix,

On Mon, 25 Sept 2023 at 08:56, Felix Brack <fb@ltec.ch> wrote:
>
> Hi Simon,
>
> On 24.09.23 21:24, Simon Glass wrote:
> > We like to put the SPL first so it is clear that it relates to SPL. Rename
> > various malloc-related options which have crept in, to stick to this
> > convention.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > Reviewed-by: Martyn Welch <martyn.welch@collabora.com>
> > Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >
> > (no changes since v1)
> > .....
>
> I just tried to apply the patch to master for testing and got the
> following result:
>
> error: patch failed: configs/am335x_baltos_defconfig:18
> error: configs/am335x_baltos_defconfig: patch does not apply
> error: patch failed: configs/am335x_igep003x_defconfig:20
> error: configs/am335x_igep003x_defconfig: patch does not apply
> error: patch failed: configs/dh_imx6_defconfig:39
> error: configs/dh_imx6_defconfig: patch does not apply
> error: patch failed: configs/starfive_visionfive2_defconfig:47
> error: configs/starfive_visionfive2_defconfig: patch does not apply
>
> For what I want to test (changes for PDU001 board) this doesn't matter
> however. I'm just not sure: should I go ahead with testing or wait for
> an updated patch?

I had to resync the defconfigs before this patch, to avoid conflicts
when applied.

So you can use './tools/moveconfig -Cy' and then the series should apply OK.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
