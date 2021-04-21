Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3AA366616
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Apr 2021 09:14:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48F18C57196;
	Wed, 21 Apr 2021 07:14:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49D0FC57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 07:14:46 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id z6so3749499wmg.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 00:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gHA+8V/zB2srsKiGcZavDNT5MLXE5Pe17gKKQV4RuXw=;
 b=K+PYYfqmaL9bsCPcqAaXzk4SXMPgtmO0YR8uNJ1qISdalxgHj4I1BcGiiJk11uC1Pr
 H2iwmGMoUZVb0aEnzsGlpwPdkTjDeeO20X4hFJYABi09TWmBfvdfYx1xHHLtDtD+mHud
 nltZWZfZ6A2H7O2C+OZzz3HiRgwyF4Wirad/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gHA+8V/zB2srsKiGcZavDNT5MLXE5Pe17gKKQV4RuXw=;
 b=iBU5t/8vaU4kYg7MUnoMOEJl4/InNj33l3ubheefZ0kaFpVf/9c45EyA/cPaLOLKeA
 bd4GBdvAuwUL1QPL7fkKyRBsP5L3rpUaE7k/GJL/IB/mfMF6mLttJmMPa6xESR0VHEZ7
 uGtj16CU6Ko6MsTmNUQx5LSvhWRVNQJe+alETwgGIof6jty1TkILEc5JQYB92eQmQkV2
 VDJBWVcJ3qamsU+v4Z90XOU8c/p4dFoLRAJ1+rKlsD3QwQrQktS+68gK3odGDURIzZKf
 VzY1aWMqTRWyDV8uvPes1dZLwOExTkzZnyzspbuA+tUcuzVMPFuEvU14b2DhKAaiS1FI
 5SYQ==
X-Gm-Message-State: AOAM532WtL/pQLM4B9hIn0mDk6C3cdcotNVPgjX0+P4JN/fjABtaBlF9
 P1NkIrSu+dt5vVGAyjdMrSb5/db/qHnb0fXYJEwgYg==
X-Google-Smtp-Source: ABdhPJw8r7MKxGgjB+klSIFwlGnq49Rs0p6UW/kMhmOTq6iLQkMvgvqB2/JnaOB3G+3ehbTlF0YElB1R6LNsh2DFcj8=
X-Received: by 2002:a7b:c454:: with SMTP id l20mr8390331wmi.65.1618989285450; 
 Wed, 21 Apr 2021 00:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210326031303.833293-1-sjg@chromium.org>
 <20210326031303.833293-2-sjg@chromium.org>
 <3b3de37f-90ea-b745-8145-0fe63e8941a6@denx.de>
In-Reply-To: <3b3de37f-90ea-b745-8145-0fe63e8941a6@denx.de>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 21 Apr 2021 19:14:29 +1200
Message-ID: <CAPnjgZ1M01wjxNiFVdM5Qj4JYzVeH9U16V-7xr6F3cOPyNgB9A@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Peng Fan <peng.fan@nxp.com>, Reuben Dowle <reubendowle0@gmail.com>,
 Marco Franchi <marcofrk@gmail.com>, Robert Marko <robert.marko@sartura.hr>,
 Samuel Holland <samuel@sholland.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 Ramon Fried <rfried.dev@gmail.com>, Harald Seiler <hws@denx.de>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Beniamino Galvani <b.galvani@gmail.com>, David Bauer <mail@david-bauer.net>,
 Trevor Woerner <twoerner@gmail.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Pavel Machek <pavel@denx.de>,
 Anup Patel <anup.patel@wdc.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Pratyush Yadav <p.yadav@ti.com>,
 =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Stefan Roese <sr@denx.de>, u-boot-amlogic@groups.io,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Alifer Moraes <alifer.wsdm@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Mario Six <mario.six@gdsys.cc>,
 Andy Yan <andy.yan@rock-chips.com>, Dalon Westergreen <dwesterg@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Joel Johnson <mrjoel@lixil.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Atish Patra <atish.patra@wdc.com>,
 "Matwey V. Kornilov" <matwey.kornilov@gmail.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Holger Brunck <holger.brunck@hitachi-powergrids.com>,
 Dirk Eibach <dirk.eibach@gdsys.cc>, Loic Devulder <ldevulder@suse.com>,
 Akash Gajjar <akash@openedev.com>, Eugeniy Paltsev <paltsev@synopsys.com>,
 Levin Du <djw@t-chip.com.cn>, Adam Ford <aford173@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Jack Mitchell <ml@embed.me.uk>,
 Chin-Liang See <clsee@altera.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Banglang Huang <banglang.huang@foxmail.com>, Maxim Sloyko <maxims@google.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Peter Robinson <pbrobinson@gmail.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Christian Hewitt <christianshewitt@gmail.com>, "Andrew F. Davis" <afd@ti.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Tom Warren <twarren@nvidia.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] Rename CONFIG_DM_RESET to CONFIG_RESET
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

Hi Marek,

On Fri, 16 Apr 2021 at 04:36, Marek Vasut <marex@denx.de> wrote:
>
> On 3/26/21 4:13 AM, Simon Glass wrote:
> > This config was misnamed at birth since there has never been a
> > CONFIG_RESET option used before driver model. Rename it so that it is
> > clear that driver model is the only option here.
>
> I'd say it should be kept as CONFIG_DM_*, to make it clear it is a DM
> option.

That is the status quo. There is no non-DM option though, so it is
just confusing to do that.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
