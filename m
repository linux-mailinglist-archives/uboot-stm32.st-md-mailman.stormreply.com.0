Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA19081C22E
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Dec 2023 01:03:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 554CFC6B477;
	Fri, 22 Dec 2023 00:03:42 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A45EC6B46B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 00:03:40 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7810917125bso79984385a.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 16:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1703203419; x=1703808219;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vseWRKdOOZ3I2aZ/HETu5m6IXzSyvLr5QJxJAGL7rn8=;
 b=Pw4OXicTKx3vGDQWdjbN7xUOIk1UaZTYvLGJpjG8xehqSpECLCWIXDY08oCyu4zIs1
 JKHdyNqSWrFLJnB8wV9X0p1aEPKU4tjmFsNTFGr6eoQCPpTlK9JKL+F0uAQfuJEktRX5
 b6LSr3tJV9yNTxs0X4xEsGk2tY/Q/Y3UrESXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703203419; x=1703808219;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vseWRKdOOZ3I2aZ/HETu5m6IXzSyvLr5QJxJAGL7rn8=;
 b=Gg0G8ntC6h0TJAhXZw1nAvnQNbUei+MccA0UHIugrJZUOY+TmqpmNq5quHLU5a0fEL
 2xJMbxBlDZ5lvOUAso8mFuiGuN/rydQwyq0k07es1SB4zDhMHoM3fE4HQKml0Q+/T7h/
 DebUix467IXsRKW42194/8MzwVJwGF3v6OHF8uIyzabxhI2+5GW8nyBZuBm/caXUhR2u
 aH8kGQzTwoh82OEbJaQB83ERlUIpZRcTr43AQ+GrIMzX+n3uXKCkA4x6xgx1i5NSba90
 hk54O9Fj1k2B1HO9L2E+cO2L3wYklNUKtK+nNdEoNu7dsHA/hsafVVSD9EIQvjWyu9cQ
 GRCg==
X-Gm-Message-State: AOJu0YxQLH9cOyxqSY9ScntKs6tqu/ITf9Ski+fSagCvB4X59gfUGuWi
 MGjt/4tgnz5Yb7fzCOOQUs2XKjiM9TrWaw==
X-Google-Smtp-Source: AGHT+IHrB9XCUEQqgyF4hvfzgcL4Hyn5ERp1Y4oHKD1Vuf0CxZjKB+Civ8gtnCSL6l91diIGO//UoQ==
X-Received: by 2002:a05:620a:2441:b0:781:129e:100 with SMTP id
 h1-20020a05620a244100b00781129e0100mr759474qkn.98.1703203419044; 
 Thu, 21 Dec 2023 16:03:39 -0800 (PST)
Received: from [127.0.1.1]
 (2603-6081-7b00-6400-a6f1-1968-9d2f-89bf.res6.spectrum.com.
 [2603:6081:7b00:6400:a6f1:1968:9d2f:89bf])
 by smtp.gmail.com with ESMTPSA id
 bk7-20020a05620a1a0700b0077d7326c60csm1008515qkb.38.2023.12.21.16.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 16:03:38 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>
In-Reply-To: <20231216031446.2222362-1-sjg@chromium.org>
References: <20231216031446.2222362-1-sjg@chromium.org>
Message-Id: <170320341698.2190413.10444075609654502560.b4-ty@konsulko.com>
Date: Thu, 21 Dec 2023 19:03:36 -0500
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Eddie James <eajames@linux.ibm.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, Max Filippov <jcmvbkbc@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Marek Vasut <marex@denx.de>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Thomas Chou <thomas@wytron.com.tw>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Scott McNutt <smcnutt@psyent.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Alison Wang <alison.wang@nxp.com>, Safae Ouajih <souajih@baylibre.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Michal Simek <michal.simek@amd.com>, Leo <ycliang@andestech.com>,
 Nikita Shubin <n.shubin@yadro.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Chanho Park <chanho61.park@samsung.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 00/22] Complete decoupling of bootm
 logic from commands
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

On Fri, 15 Dec 2023 20:14:04 -0700, Simon Glass wrote:

> This series continues refactoring the bootm code to allow it to be used
> with CONFIG_COMMAND disabled. The OS-handling code is refactored and
> a new bootm_run() function is created to run through the bootm stages.
> This completes the work.
> 
> A booti_go() function is created also, in case it proves useful, but at
> last for now standard boot does not use this.
> 
> [...]

Applied to u-boot/next, thanks!

-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
