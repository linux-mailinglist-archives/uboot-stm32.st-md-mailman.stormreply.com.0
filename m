Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 623824E6AD2
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Mar 2022 23:42:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DFABC60496;
	Thu, 24 Mar 2022 22:42:12 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDEFFC60469
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 22:42:10 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id m84so3339249vke.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 15:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=863MERGBx9AEo3aBgOOoCaGhUvYk2wKCrtSFXurDQpA=;
 b=H4Ij1u9GTR4JLjYLbHL7FysE4Wcpqk6w5k8ogFnIfjwNZrkHUXjxUpBs7TnzuhfeWn
 hXXBcCLzr/Q/uNdSdo4y7HMXzZyD3XPd0Yl4Gaz/I2gcggG53JAspVw8x8HPe9xkE6zS
 5gXcA1dNvbLZzdmiyML1uYacJg1mTcdEOmQsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=863MERGBx9AEo3aBgOOoCaGhUvYk2wKCrtSFXurDQpA=;
 b=16jj+LPisBPJ+H8UbHwha+RSvLgZY6cpAheLOaTUVQ1Gr8c2HdxBHZdlOorxfPnwuL
 4PYFvbyZT5AsfKQN/vDIPIQ6fO8wbk9I9j9uVxZWj+jm0IohbN2k8dBFyvMHMMo65yjK
 vEsM5ZZCUUj49IoQB+nFM6N8GgOsXTxDmKS/SiFZRQc2QlWntsHmghAQGjBmUC0XBCR8
 31yhvNPTn0vtp0grAiUNoWHwLgAsQajUXMuN7Tudr887GpNB2y6HQ/W055D4SX5iS5TJ
 8zMhGfQEYKxnajkDglpAPuO3PoUauoeW13anYZYJh47qY/Hmwpn6bcAetZd7cLWkcxWP
 hI/Q==
X-Gm-Message-State: AOAM533MDqB1XcS2A/Y80RDgFgS5v/egmkl6TYTyYx8ySQYcTVKjIj/S
 S6yabMyBjyJ66PGCHRC/Psf94Ue1IlHl64xlIK7DGQ==
X-Google-Smtp-Source: ABdhPJzHkm/XWstR+D95IQa8L0LxzE/Zz45jVjaCCIQOH7MAuc3MvX/W8WW3eUDK8CIKoW6tJjXU1ZxzZWswNhFCFF0=
X-Received: by 2002:a1f:2811:0:b0:33f:6c1e:7818 with SMTP id
 o17-20020a1f2811000000b0033f6c1e7818mr3601318vko.8.1648161729577; Thu, 24 Mar
 2022 15:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220123140415.3091482-1-sjg@chromium.org>
 <CAPnjgZ0UhAcCPmDeEPzrvYLXnPFC_sAZa6ssk=MwJkqDzHCMzQ@mail.gmail.com>
 <20220324231645.1d6fc1ab@crub>
In-Reply-To: <20220324231645.1d6fc1ab@crub>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 25 Mar 2022 11:41:54 +1300
Message-ID: <CAPnjgZ1R4s=vz-=sin4dmYJrz8nPQ9i9Bu5zxedKN3EHb=nvHQ@mail.gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Cc: Baruch Siach <baruch@tkos.co.il>, Aymen Sghaier <aymen.sghaier@nxp.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Samuel Egli <samuel.egli@siemens.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, U-Boot Mailing List <u-boot@lists.denx.de>,
 =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Hu <richard.hu@technexion.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, Marek Vasut <marex@denx.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Vanessa Maegima <vanessa.maegima@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Dario Binacchi <dariobin@libero.it>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Alison Wang <alison.wang@nxp.com>, Rick Chen <rick@andestech.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Kory Maincent <kory.maincent@bootlin.com>,
 Matthias Brugger <mbrugger@suse.com>, Joel Peshkin <joel.peshkin@broadcom.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Stephen Carlson <stcarlso@linux.microsoft.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 00/14] video: Drop old CFB code
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

Hi Anatloij,

On Fri, 25 Mar 2022 at 11:16, Anatolij Gustschin <agust@denx.de> wrote:
>
> Hi Simon,
>
> On Thu, 24 Mar 2022 13:54:22 -0600
> Simon Glass sjg@chromium.org wrote:
> ...
> >
> > Is there any word on this series, please?
>
> last week I've rebased and applied this series to next (PATCH 02/14
> dropped) and will submit a pull request when Tom merges last -rc
> into his next branch. Otherwise there will be a build error due to
> missing Nokia RX-51 related changes. Thanks!

That's great, thank you! I was thinking of doing the same thing for
LCD. What do you think?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
