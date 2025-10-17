Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E26C3BE6ED1
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 09:27:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 449E2C58D40;
	Fri, 17 Oct 2025 07:27:35 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3482AC57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 04:04:25 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b5515eaefceso1193067a12.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 21:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760673863; x=1761278663;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3IDJ+vLRLRjQM/X27foHFqyNmEo5T95YhlhbnJkmvE=;
 b=aPcytVi7u/+gh9SByD4u87OtldZqj/2Itgw3M07dHDy0ZS+JJ0X9tHdTMtiT3WXBP6
 tny2guMtOXzFmlgm/gw0rLSdaa+jDCYtmOIWH1MHAiUlOMgCYyMj9uahxGqoBYlotLtV
 ND7BDV9iHSCKJ5Gr7lZl8t+7QnDWTfv082Xfh6+bpz0DOH4PrRvUsPwJ6h+XTxUdtMwp
 w83uylvy9oHmgYg4YX5kpBj+rTqfEHGr6ROpGlPI9N371yJk5hZUT7RiKbTUhHo1SxHl
 QRxG3atrO7Hcjd+wCgzF5FyzBWIwcjVhkXR1maBlkKVuoLbbTLoSez7Rv/dMtVpYltvW
 bD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760673863; x=1761278663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3IDJ+vLRLRjQM/X27foHFqyNmEo5T95YhlhbnJkmvE=;
 b=qhkQABBHBGW05NDryFgFdJH+wBCYelKWZGIFATRjBhoIISShkjTfanvbu5Q+0aKao0
 rbfL+viTg5e279uN9NRQnw7DcvjbEfkz7R/Z6kir52WagHME7E21Iveq8fB9Ln0nQ48P
 LfaBNe5/8gAeJP3Za+HqZZM6JmPnAeCib+hhYSSeqtiF5DZJrddrq807puv65cLjkdOq
 ZW06ucWGW7WiSGi6nI+6tR7lIunx0PIQy9F9AIamns+0YqQ2Oc9BNdybxIrqC9aFVTs/
 5wdZyjvTxTpsXlwHnzquPpIb5fdvWbkG2nELS3e9KJKqOyzK6qz3l6UWV4CTF39xiT3s
 sfuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1rrt6Ns6qgaKAw7GjrSAcjqrkwUX/4Y4oer0jZdy4RkcrOv3mpHfrANQKTr6WuseQY3iF7+awrnZdNw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywt7W7+devapy7stvyr6nXw0VffSnwpgPYMsCe2xHDebRsjBlkZ
 hTIXLPCiM9Hha7KxETvG+U/3Ev/gGErMctwIOTbeVdG7bK0eSbf0PVUyKDTnO4urrdiVObqv+/I
 GJB9WdSf2+gySwznXEIfMtd2/G6aG7Q==
X-Gm-Gg: ASbGncvOmHgu/gV+01QblhKw6ft+OjJuasFRMgNryoG2TPZovLouTazCVsupL4KN3T2
 scgPXds9qJzRLl5Fmvgnp9tQBo6gwwksHyCGysoErKCrM1r4ApS+46MJIWm9cWdHEQqGx4ezNOm
 YwmmgtwEQp1fsgos7rWLaZaoegloOvs/yBfMp8yW043DbGOs73gUf6jGyq309S0HuBl4sD2k//c
 xNnGn0iFvafvbyRz8aMPX2s2mRsdDU8m7JC05fYZ8R4lGC7BVM1aR7QkPmvHf4A/kRV0HZcJNyM
 HmFb2z2ewcTU7sCYcfakTlFa6LkyluVps7MoRA==
X-Google-Smtp-Source: AGHT+IHmzB317oQkQHpHZys/FCDRniELEzvLa5cBeIzNljKywnu98WHQOROmEkt1+b0K86qlXFzZhCreAxtHUKqwOEE=
X-Received: by 2002:a17:902:f541:b0:28d:1939:f9c8 with SMTP id
 d9443c01a7336-290cb0803d5mr30672475ad.26.1760673863365; Thu, 16 Oct 2025
 21:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
 <20251015-clk_ops-v1-21-5f80f827407e@linaro.org>
In-Reply-To: <20251015-clk_ops-v1-21-5f80f827407e@linaro.org>
From: Greg Malysa <malysagreg@gmail.com>
Date: Fri, 17 Oct 2025 00:02:55 -0400
X-Gm-Features: AS18NWDw-WCq3s6Td5-JQy4J-j4STU-cSY6siJRlDbWGdZZhreSlSr0RoZPk1VQ
Message-ID: <CABdDSeVJnZfp86yDXw6sh4cioKTsYj3NcGy_sgVMdja0K_pApg@mail.gmail.com>
To: Andrew Goodbody <andrew.goodbody@linaro.org>
X-Mailman-Approved-At: Fri, 17 Oct 2025 07:27:34 +0000
Cc: adsp-linux@analog.com, Peng Fan <peng.fan@nxp.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Heiko Stuebner <heiko@sntech.de>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Alice Guo <alice.guo@nxp.com>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
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
 Michal Simek <michal.simek@amd.com>, Utsav Agarwal <utsav.agarwal@analog.com>,
 Heiko Schocher <hs@nabladev.com>, Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Tingting Meng <tingting.meng@altera.com>,
 Ian Roberts <ian.roberts@timesys.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 21/24] clk: adi: Remove negative error
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBPY3QgMTUsIDIwMjUgYXQgMTA6MzPigK9BTSBBbmRyZXcgR29vZGJvZHkKPGFuZHJl
dy5nb29kYm9keUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IGNsa19nZXRfcmF0ZSgpIHJldHVybnMg
YSB1bG9uZyBzbyBkbyBub3QgYXR0ZW1wdCB0byBwYXNzIG5lZ2F0aXZlIGVycm9yCj4gY29kZXMg
dGhyb3VnaCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBHb29kYm9keSA8YW5kcmV3Lmdv
b2Rib2R5QGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvY2xrL2FkaS9jbGstc2hhcmVkLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2FkaS9jbGstc2hhcmVkLmMgYi9kcml2ZXJzL2Ns
ay9hZGkvY2xrLXNoYXJlZC5jCj4gaW5kZXggZGNhZGNhZmE5ZDIzNjg4MmFmOGM3YjM5N2VlZWVi
NDQ0NjFhMjNjYi4uNjAwZTIyOTQwZThjYjYwYjFlNTEwYTc0ZWU4MDY4Y2NmMGM3ODQ4YSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9hZGkvY2xrLXNoYXJlZC5jCj4gKysrIGIvZHJpdmVycy9j
bGsvYWRpL2Nsay1zaGFyZWQuYwo+IEBAIC0xNiw3ICsxNiw3IEBAIHN0YXRpYyB1bG9uZyBhZGlf
Z2V0X3JhdGUoc3RydWN0IGNsayAqY2xrKQo+Cj4gICAgICAgICByZXQgPSBjbGtfZ2V0X2J5X2lk
KGNsay0+aWQsICZjKTsKPiAgICAgICAgIGlmIChyZXQpCj4gLSAgICAgICAgICAgICAgIHJldHVy
biByZXQ7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gICAgICAgICByZXR1cm4gY2xr
X2dldF9yYXRlKGMpOwo+ICB9Cj4KPiAtLQo+IDIuNDcuMwo+CgpSZXZpZXdlZC1ieTogR3JlZyBN
YWx5c2EgPG1hbHlzYWdyZWdAZ21haWwuY29tPgoKVGVzdGVkIG9uIG15IHNjNTczIGFuZCBzYzU5
OCBib2FyZHMsIGxvb2tzIGdvb2QuCgpUaGFua3MsCkdyZWcKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
