Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63ABEC9FE
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 Oct 2025 10:35:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A57A7C5A4CA;
	Sat, 18 Oct 2025 08:35:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B992C5A4C9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 08:35:02 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-63994113841so4689117a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 01:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1760776501; x=1761381301;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GyQWOulrh/Eer1xNnW7Kyg8KGv0rCXH9pL1ZkY7eaSU=;
 b=PxvWvkgI5nnoeRoIpd33joVF1sI182OCUKDag48HiJ7ThzGv+c0TP0UwiuLCWpbeDX
 hDkPQVP8XXQ+MR/a91BB2xuMCpzsrhobVSqU7xs0S1lPriGUWK4tZ/wncydQ//+fEuUK
 KfnFvlA098rmYj9B+8yHhgmeJF3Z1+15w1YRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760776501; x=1761381301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GyQWOulrh/Eer1xNnW7Kyg8KGv0rCXH9pL1ZkY7eaSU=;
 b=owcZkzAUbhupt7+GLdIVWtY4ZpmXMLAZQeMJFk+9P9/3vqGHq4EcZ8pkrhKEr3cEUR
 ioKmQLeQegWcphq/AduFmlU+UqTe1rzqcCU+ZvyCNqAckJJp4B+tDKMOMroIbWKReJ/6
 7WYoQ60nRkzFhGUe2zxIEnkeejReCBIKvxSAoAhQv3gzcWjOGVN3E+DlxX1YZqnDaaUz
 Ep2I4RGf1fIfDuvJLMfJ0FsrBhaB7bsLkfeYtndAKAywwzlGYnp8x7DMa1uRtKk+UGbi
 c7oOcriUu/ibcFe76d4cohYV//2WkPIOLhVOGXz7Rz+/tLPDeIqj9wEi2mUSu0dWyUaY
 VKOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV15iRmuyA7qC3QPR33h6kl0vmbGbvpe050Z0KIbk20VdcdOJGIV1wfRgTB2Ujo3xXOOOf08XCi8B3+Fw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxWdOT22MbapdwNYQQy6JoynX6setIAmKmKKSCwDHq1YohvI84r
 +So1sqizblxv+ug6O2TNSKJsjbOunxxL1pqi/Tolf9FD7xCg6/Klaj551DKjaoKX+Pnx2mxU7OH
 r5p23dSduu0w7cMDhjuhJzlpnQGUajldBqSeWL72I
X-Gm-Gg: ASbGncs+56Qtv/dncVrHjxFHUOb52AJqLoW8Ru3I1C4cLt39h2m9CwSToE8EU/Z191c
 5j7Luj4tHPUgmuRugecJCgwBpjg4Dvtno1wSjWt9z2+6CUGu2KrVeHay/XTzyYaqLdo4FL+ztUh
 f/RWadgqDNITExz80jwZNxKf8SzaZSabV0fdxuxrZ5X6ULOA/XUf+YqRa+dbnMuj40KwMWRYTPp
 b7WQcoNVKfIOv2CVp3G8ciwllRgKmNiQRAZD15nNJ0FVHbfF45qdekNgVjoZW/A9dsF6qA=
X-Google-Smtp-Source: AGHT+IGWGGbVkCD3XOXmUZtpd0mvxQ85Bf+KNTpUMy0MxPwXGTLHNb9i04xYr36/ycvqCIxLVPMPa77V3aHPjtVYa5s=
X-Received: by 2002:a05:6402:286:b0:637:c0c3:fbc1 with SMTP id
 4fb4d7f45d1cf-63c1f6d3244mr4188243a12.30.1760776501460; Sat, 18 Oct 2025
 01:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
 <20251015-clk_ops-v1-1-5f80f827407e@linaro.org>
In-Reply-To: <20251015-clk_ops-v1-1-5f80f827407e@linaro.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 18 Oct 2025 09:34:48 +0100
X-Gm-Features: AS18NWBnLaAN6fZ9FkElI-GXJyJ7IwNjlDP4wjDRZycZoPdxyTeUW7J3w9JNY2U
Message-ID: <CAFLszTiPBOmz88HXUAM6Qdrth9xm5sgeyRxVO=GV_1GVAFucSA@mail.gmail.com>
To: Andrew Goodbody <andrew.goodbody@linaro.org>
Cc: adsp-linux@analog.com, Peng Fan <peng.fan@nxp.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Heiko Stuebner <heiko@sntech.de>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Alice Guo <alice.guo@nxp.com>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Minkyu Kang <mk7.kang@samsung.com>,
 Hal Feng <hal.feng@starfivetech.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Jonas Karlman <jonas@kwiboo.se>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Joel Stanley <joel@jms.id.au>, Quentin Schulz <quentin.schulz@cherry.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Joseph Chen <chenjh@rock-chips.com>, Dai Okamura <okamura.dai@socionext.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>, Yao Zi <ziyao@disroot.org>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Shih <sam.shih@mediatek.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Minda Chen <minda.chen@starfivetech.com>, Paul Barker <paul@pbarker.dev>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Jonathan Currier <dullfire@yahoo.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, uboot-snps-arc@synopsys.com,
 Michal Simek <michal.simek@amd.com>, Greg Malysa <malysagreg@gmail.com>,
 Heiko Schocher <hs@nabladev.com>, Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Tingting Meng <tingting.meng@altera.com>,
 Ian Roberts <ian.roberts@timesys.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 01/24] clk: meson: Remove negative error
	returns from clk_get_rate
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

Hi Andrew,

On Wed, 15 Oct 2025 at 15:32, Andrew Goodbody
<andrew.goodbody@linaro.org> wrote:
>
> clk_get_rate() returns a ulong so do not attempt to pass negative error
> codes through it.
>
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> ---
>  drivers/clk/meson/a1.c   | 10 +++++-----
>  drivers/clk/meson/axg.c  | 10 +++++-----
>  drivers/clk/meson/g12a.c | 36 ++++++++++++++++++------------------
>  drivers/clk/meson/gxbb.c | 20 ++++++++++----------
>  4 files changed, 38 insertions(+), 38 deletions(-)
>

Don't change the driver interface...just update the uclass.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
