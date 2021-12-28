Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CDC48076B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Dec 2021 09:33:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47632C5F1EF;
	Tue, 28 Dec 2021 08:33:18 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF03EC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 08:33:16 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 s21-20020a05683004d500b0058f585672efso18741768otd.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 00:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afIQysNJQf/hjgLi9fetsyfTXQy3zJ9L0+IL2zCPL+U=;
 b=TU3xKFckuBytQXzGRrnZihl0yeKbwPG8JB/TOw1KehrBJANQhXLrGMTOwHa72CKI2K
 TfVgzuySnZIU/pGlaY7iO8BSejsmufpK6wGvplqWm+hGk4DrKC+CkFvdT5BKTxC5rIsV
 f5rnwzoAogqm38Ak8FibY7hG7lMKlVOhcyO1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afIQysNJQf/hjgLi9fetsyfTXQy3zJ9L0+IL2zCPL+U=;
 b=bQ5AYA6l0i28jhs1tlSaQTkA1eO268PPnSzu3V24Ma9PbtreCClq3JGSh/LAPWxhHs
 UDamuvaxB35rfyIRFhZRMgsKyRisxiGUNptLB2lCZpY+0EwLXl1uNCi9JmlM6sP4GpGj
 XhhjBR4MJtXIN4UYYECAo8giSJ+mLggmTpPszwP13uWy3eP64yo5yYJAwDT/oc+vpMG5
 XGlOmIsgdvnwN8pC7OXPB9tttUtUPSn3Pt1kryfttmS++Ai0hqAiNoPApi/gHA6hiFTN
 DOuOHtGPJ5uCeWfmOYTMxGvktoli3idOBP7AvscHmYRHQ1w6hvHMnBRXtxlRTYoOCOqS
 a4JQ==
X-Gm-Message-State: AOAM533rmDuTPFIn69XBhQGnisvwy33UrZbwoA641p/1W70eCYGp7iV0
 CulljFee4uCQNMDNAqvLyifX4vSvw8Vu1UWISmszCQ==
X-Google-Smtp-Source: ABdhPJzZTdsVoYVCTBQu1q1sYqw5C7NZ1pW8MHAHj3gTV5ltiByZow4hmo5F0r2pVDXTsCUjBMqlmxEf0rKOXKNAg1A=
X-Received: by 2002:a9d:24e4:: with SMTP id z91mr14338401ota.11.1640680395359; 
 Tue, 28 Dec 2021 00:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
 <20211214175652.RFC.4.I0d0c7b01c8aefb9ef4b2d5f78feda422bc59593e@changeid>
In-Reply-To: <20211214175652.RFC.4.I0d0c7b01c8aefb9ef4b2d5f78feda422bc59593e@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 28 Dec 2021 01:33:01 -0700
Message-ID: <CAPnjgZ0krbOuwpwGZiTtKRsHwjTaA67RcvbDxUKge9kJkCsjjA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: David Feng <fenghua@phytium.com.cn>,
 =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>,
 Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Peng Fan <peng.fan@nxp.com>,
 Chin-Liang See <clsee@altera.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Rainer Boschung <rainer.boschung@hitachienergy.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Wolfgang Wegner <w.wegner@astro-kom.de>, Kamil Lulko <kamil.lulko@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Dalon Westergreen <dalon.westergreen@intel.com>,
 Aleksandar Gerasimovski <aleksandar.gerasimovski@hitachienergy.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefan Roese <sr@denx.de>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Stelian Pop <stelian@popies.net>, Niel Fourie <lusus@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Kristian Amlie <kristian.amlie@northern.tech>,
 egnite GmbH <info@egnite.de>, Ruchika Gupta <ruchika.gupta@nxp.com>,
 Shengzhou Liu <Shengzhou.Liu@nxp.com>, Dirk Eibach <dirk.eibach@gdsys.cc>,
 Heiko Schocher <hs@denx.de>, Qiang Zhao <qiang.zhao@nxp.com>,
 Ilko Iliev <iliev@ronetix.at>, Thomas Chou <thomas@wytron.com.tw>,
 Tetsuyuki Kobayashi <koba@kmckk.co.jp>, Sinan Akman <sinan@writeme.com>,
 Vikas Manocha <vikas.manocha@st.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Ashish Kumar <Ashish.Kumar@nxp.com>, Rick Chen <rick@andestech.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Jens Scharsig <esw@bus-elektronik.de>,
 Vladimir Zapolskiy <vz@mleia.com>, Adam Ford <aford173@gmail.com>,
 Mingkai Hu <Mingkai.Hu@nxp.com>, Simon Guinot <simon.guinot@sequanux.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>,
 Masakazu Mochizuki <masakazu.mochizuki.wd@hitachi.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Max Filippov <jcmvbkbc@gmail.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, "Andrew F. Davis" <afd@ti.com>,
 Aaron Williams <awilliams@marvell.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Walle <michael@walle.cc>, Paul Burton <paul.burton@mips.com>,
 Usama Arif <usama.arif@arm.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 TsiChung Liew <Tsi-Chung.Liew@nxp.com>, Bin Meng <bmeng.cn@gmail.com>,
 Andes <uboot@andestech.com>
Subject: Re: [Uboot-stm32] [RFC PATCH 4/5] configs: Migrate
	CONFIG_SYS_MAX_FLASH_BANKS to Kconfig
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

Hi Patrick,

On Tue, 14 Dec 2021 at 10:01, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Use moveconfig.py script to convert define CONFIG_SYS_MAX_FLASH_BANKS
> and CONFIG_SYS_MAX_FLASH_BANKS_DETECT to Kconfig and move these entries
> to defconfigs.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  README                                       |  3 ---

Reviewed-by: Simon Glass <sjg@chromium.org>

Note that if you use -Cy flags to moveconfig it will create a commit
and message for you.

[..]


>  174 files changed, 101 insertions(+), 127 deletions(-)
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
