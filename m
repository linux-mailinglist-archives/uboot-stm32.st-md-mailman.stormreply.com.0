Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 703D2676801
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 Jan 2023 19:18:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08D7FC6410A;
	Sat, 21 Jan 2023 18:18:22 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74FF7C6334A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Jan 2023 18:18:20 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id m12so6118944qvt.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Jan 2023 10:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qN/HpyKCRq3or3n+OTaokQCz7OqD8eDki+PRatioCH4=;
 b=Gat0GcMuuxIF7w9trw+ECg9U5CGvxqDE8gbVUj28k3ViCfo2OQMIpGp1hg3NUsmEuK
 KLg/L2Z+065dPtgGp80lc/orhkgd9NKXo8pnci1LwulXG8j90Ps93Ri+pZdlssSNaqvf
 GXqi/plhVC509ioR127GBfP248lfCIzYNjxK/LeK1ZSSD/33XToz+TEDYHnwFFLpof6Y
 ykBS5+FQXj3vt1Gmr0ZBXVpHfMptUFcLmKQYHR03cF8k8ggCGcpQw8qGXbpb9zhrI4ma
 vqomlrLgGySaiShttldvjUSaWFEtWYQr6w5Aq6HQ94khT9SliZSBhO2QS+x/ooJVn+Rq
 Z9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qN/HpyKCRq3or3n+OTaokQCz7OqD8eDki+PRatioCH4=;
 b=7IYdR+Kj5xZ73YEch7imrK0Q7oaingORzHnYX4fsKP+SIr14mItPc9PjWVs4icIVFC
 7JiEUfPHS+3byP5z7qPXGoDi31JWK3nvft8qaZMPD+KIwTnyHfR0+E/PBbuHqYpAkdqm
 6kBI15zCGW+B6e8zCQnVDlsoaAEev6tMrEUJ+n1n3dxOQ9fQHg2EVkonYxtYUCCKc1Hn
 DR0F8Tb1clCYVEX81jhvWgEtRunaLR2yWnZCac9QiJxOs86C1S1hAXH3/jDNfUGBYkdY
 i/ArPHwuvAVVRoUC73uDjiRJrbMnX2u0c31ZjT/s+9xFqavqdZsnc0WSyA6lJvWBaIA0
 TAjQ==
X-Gm-Message-State: AFqh2krOEAuLh/XhmPgoUEWvyXl1TRN7085gs9FqR8rL36FQoQqyrThX
 CLzX58V86eUBVyRWP8pVaCY=
X-Google-Smtp-Source: AMrXdXtIknTtu+ENWEr4n49P/dHkZ1LpuXJEdW46X3Um2KQ+FbyjCYDP1lEVdAjcMrAQWXnUvfaRkA==
X-Received: by 2002:a05:6214:3d9c:b0:534:7db9:4c2c with SMTP id
 om28-20020a0562143d9c00b005347db94c2cmr33464146qvb.2.1674325099287; 
 Sat, 21 Jan 2023 10:18:19 -0800 (PST)
Received: from localhost (pool-173-73-95-180.washdc.fios.verizon.net.
 [173.73.95.180]) by smtp.gmail.com with UTF8SMTPSA id
 x23-20020a05620a0b5700b00706a452c074sm8740534qkg.104.2023.01.21.10.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 10:18:18 -0800 (PST)
From: Sean Anderson <seanga2@gmail.com>
To: patrick.delaunay@foss.st.com,
	u-boot@lists.denx.de
Date: Sat, 21 Jan 2023 13:18:17 -0500
Message-Id: <167432509251.2956673.14412502259037288342.b4-ty@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221213145708.v2.1.Ia0bc6b272f1e2e3f37873c61d79138c2663c4055@changeid>
References: <20221213145708.v2.1.Ia0bc6b272f1e2e3f37873c61d79138c2663c4055@changeid>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, t-kristo@ti.com, sjg@chromium.org,
 gabriel.fernandez@foss.st.com, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2] cmd: clk: probe the clock before dump
	them
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

On Tue, 13 Dec 2022 14:57:10 +0100, Patrick Delaunay wrote:
> The clock UCLASS need to be probed to allow availability of the
> private data (struct clk *), get in show_clks() with dev_get_clk_ptr()
> before use them.
> 
> Without this patch the clock dump can cause crash because all the
> private data are not available before calling the API clk_get_rate().
> 
> [...]

Applied, thanks!

[1/1] cmd: clk: probe the clock before dump them
      commit: dbd5ad09d2625cc631c1a98ec4517bde59f49b0d

Best regards,
-- 
Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
