Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC0E98BFDD
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Oct 2024 16:26:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED4EDC78012;
	Tue,  1 Oct 2024 14:26:45 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40487C69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 14:26:38 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4585721f6edso35685081cf.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Oct 2024 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1727792797; x=1728397597;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rUs7seA3ZKvlwzncV7ZzeBRhe+CiXMo3Ri/ChJePYXw=;
 b=DCKVK6ShJVejQGBgLe0jX48W+FeiwfkfjN1+3xHnrkFv9ZBpl3q32DgFRpDoD83ten
 Z9wpTFlIx2ah/CmMO4veUHKytsnxSpXZCqcHhPvf9UEebX5O4xMrxEwJGv5Yh9gjM2V9
 pAwyFPmUS1gL3lIrok04y8pz38+ZKwzxLftwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727792797; x=1728397597;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rUs7seA3ZKvlwzncV7ZzeBRhe+CiXMo3Ri/ChJePYXw=;
 b=E+IhYPFhj7f+SaJDgCzJbU5vBPLzw4jc5PKMo0g5v/vTMOqVd/DGsl0Fcu3hkFI5cq
 UmS/DI6pNwly9P8KQPakzFt57hg1aIlMvly1DfTNnxbfRAFW6uHVhjF5iecTp2rO/uWe
 LYXgQmsMqdiwVXDK16FuVXQjkREIjibG/nYWWhS6QhNaeZi8hNPoHWLaaR69fxSTcxsu
 gNtG3N+fsC8igO/g9puUToZnvmP8dGioxZ3hnP/1AeICvaqRscWLUgbNm/t8trDq1d/5
 1qMKGGW3bF1j+oWwhgC/pU25TbHOYnDAISH0r3FH/0ioMox9SwKy3U3cWNhBL7o33yQj
 Ue/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+dUBCaL/oReZsiC29NTYGcdQlfZua7tjo0uBkiufsD9RQhp+VSdCnBIU6lC07j/dzTcO3O4unN81vpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxq6kvtzTXzbYIuF2bL9TPYl8MbeI5Z+FMWiGsJov/zKxPkXxDa
 35s0EVYDkwop41GjqPg2Htx20l9y92lX9bDd3grp/b42LwYZPi6D1cECgQJGKtQ=
X-Google-Smtp-Source: AGHT+IGwcIDJfPGAE7sDAYQ0QA/zf6cPHjY3vkeOK4j3hCDZHoQPzPRRcvw/kCHUiCDZwu9Ch6Jiow==
X-Received: by 2002:ac8:5885:0:b0:458:34df:1e65 with SMTP id
 d75a77b69052e-45c9f270fbbmr191931881cf.44.1727792796898; 
 Tue, 01 Oct 2024 07:26:36 -0700 (PDT)
Received: from [127.0.1.1] ([187.144.65.244]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45c9f2dff74sm46058441cf.47.2024.10.01.07.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 07:26:35 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Marek Vasut <marex@denx.de>
In-Reply-To: <20240926231457.2933914-1-marex@denx.de>
References: <20240926231457.2933914-1-marex@denx.de>
Message-Id: <172779279069.133202.868540972759905145.b4-ty@konsulko.com>
Date: Tue, 01 Oct 2024 08:26:30 -0600
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 u-boot-qcom@groups.io, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Kostya Porotchkin <kostap@marvell.com>,
 Ben Wolsieffer <benwolsieffer@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jonas Karlman <jonas@kwiboo.se>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, u-boot@dh-electronics.com,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Simon Glass <sjg@chromium.org>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/4] power: regulator: Trigger probe of
 regulators which are always-on or boot-on
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

On Fri, 27 Sep 2024 01:14:12 +0200, Marek Vasut wrote:

> In case a regulator DT node contains regulator-always-on or regulator-boot-on
> property, make sure the regulator gets correctly configured by U-Boot on start
> up. Unconditionally probe such regulator drivers. This is a preparatory patch
> for introduction of .regulator_post_probe() which would trigger the regulator
> configuration.
> 
> Parsing of regulator-always-on and regulator-boot-on DT property has been
> moved to regulator_post_bind() as the information is required early, the
> rest of the DT parsing has been kept in regulator_pre_probe() to avoid
> slowing down the boot process.
> 
> [...]

Applied to u-boot/next, thanks!

-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
