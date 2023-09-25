Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A9D7ADAC3
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Sep 2023 16:58:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C30CC6B462;
	Mon, 25 Sep 2023 14:58:17 +0000 (UTC)
Received: from mail.ltec.ch (mail.ltec.ch [95.143.48.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCACEC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Sep 2023 14:58:15 +0000 (UTC)
Received: from nebula.ltec ([172.27.11.2] helo=[172.27.11.35])
 by mail.ltec.ch with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <fb@ltec.ch>)
 id 1qkn04-00CsDy-91; Mon, 25 Sep 2023 16:55:52 +0200
Message-ID: <2a727cd4-bbda-409e-8d0e-1aafba182873@ltec.ch>
Date: Mon, 25 Sep 2023 16:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20230924192536.1812799-1-sjg@chromium.org>
 <20230924192536.1812799-2-sjg@chromium.org>
From: Felix Brack <fb@ltec.ch>
In-Reply-To: <20230924192536.1812799-2-sjg@chromium.org>
Cc: Fabio Estevam <festevam@denx.de>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Chin-Liang See <clsee@altera.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Heiko Thiery <heiko.thiery@gmail.com>, Stefan Roese <sr@denx.de>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Uri Mashiach <uri.mashiach@compulab.co.il>, Peter.Chubb@data61.csiro.au,
 Adam Ford <aford173@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
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
 Chee Hong Ang <chee.hong.ang@intel.com>, Michal Simek <michal.simek@amd.com>,
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

Hi Simon,

On 24.09.23 21:24, Simon Glass wrote:
> We like to put the SPL first so it is clear that it relates to SPL. Rename
> various malloc-related options which have crept in, to stick to this
> convention.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Martyn Welch <martyn.welch@collabora.com>
> Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
> 
> (no changes since v1)
> .....

I just tried to apply the patch to master for testing and got the
following result:

error: patch failed: configs/am335x_baltos_defconfig:18
error: configs/am335x_baltos_defconfig: patch does not apply
error: patch failed: configs/am335x_igep003x_defconfig:20
error: configs/am335x_igep003x_defconfig: patch does not apply
error: patch failed: configs/dh_imx6_defconfig:39
error: configs/dh_imx6_defconfig: patch does not apply
error: patch failed: configs/starfive_visionfive2_defconfig:47
error: configs/starfive_visionfive2_defconfig: patch does not apply

For what I want to test (changes for PDU001 board) this doesn't matter
however. I'm just not sure: should I go ahead with testing or wait for
an updated patch?

regards Felix
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
