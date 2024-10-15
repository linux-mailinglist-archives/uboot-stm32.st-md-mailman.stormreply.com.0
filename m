Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 868CD99F76C
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2024 21:44:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BBEAC78030;
	Tue, 15 Oct 2024 19:44:08 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17D1CC7801A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 19:44:01 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-287b8444ff3so2150603fac.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 12:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1729021440; x=1729626240;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JJ+CAV0HwhCBxkGtzq0rF/65TDmyI6azyrWVeyvFyN8=;
 b=TCPkwM03p5Rbut3MiAr7a061P/2inQT+wC0SSKwxoyP5s7eVzWxohaR2tH33dg3347
 HfPM57ccVTE6EfTuvIi4KsJTLoJI5PSXkpadGqGv+/VAfKNrUc2ZVZq0SNuWCErEVnwd
 Mlqs1czNHX9hL74/DRAinXCZCGuxSr3jG0/1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729021440; x=1729626240;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJ+CAV0HwhCBxkGtzq0rF/65TDmyI6azyrWVeyvFyN8=;
 b=rlrpMO53oyMfA4YiZviKV57a//YfiSPUNdERxJMEYaO6dBOmk4ffMAbYuuP0oOswNh
 4qTgGBYgibhidV+8yvn3Qw83BDMoVYoRPI6SFRBr10yg05DrS1GTAYeVpIbN9mWlnKa/
 IYTYd0HeBtOkMOd5NIQTQ81DlAYeQoLBmE+mW3h8pXciT/2tTEKLQnBzr0xa/1ZRrWpx
 UySFkmEZ7jxxjClVQMwpXytzJKzIMt4rY6JbUMeOYutEDJSTa9I3v1JknX6zkq9OUntt
 iV44flN+VCw5zbCNw424LqwEABVgVMwpw4jM68s59/UiBpO8xiamyxgGcgmlmWqJDINa
 xthA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq7PrBqMOLfo63RvSlThCVucteR5VyNK0+yzO2ivNcXZux42uM0K9qO8STB/9mpUrDq03wuUYqRnAh2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxYIOZdNalqJsG5NPaeP1eF/toxE2ZXuJx2XTOnRR2D3UlI/cVE
 ZvrBjKTkU3KWlJ2xuVU6uDeNaA5KQV8QYqisJTprjLlT5UVF1MKwx7m218lggM0=
X-Google-Smtp-Source: AGHT+IFC/3guCbGBr84UxDNuXTWsQeb0fYfG5hs20rGBfqaxau/ZdVRWM1SsuvwrI2CYDPFBHQ00jQ==
X-Received: by 2002:a05:6871:70e:b0:277:e6fc:4a69 with SMTP id
 586e51a60fabf-2886dd4b22bmr10619772fac.2.1729021439719; 
 Tue, 15 Oct 2024 12:43:59 -0700 (PDT)
Received: from [127.0.1.1] ([187.144.65.244]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b13899c31esm94873385a.99.2024.10.15.12.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 12:43:59 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Marek Vasut <marex@denx.de>
In-Reply-To: <20241004230756.371153-1-marex@denx.de>
References: <20241004230756.371153-1-marex@denx.de>
Message-Id: <172902143755.5381.3133865412226742988.b4-ty@konsulko.com>
Date: Tue, 15 Oct 2024 13:43:57 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: Sumit Garg <sumit.garg@linaro.org>, u-boot@dh-electronics.com,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 AKASHI Takahiro <akashi.tkhro@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Peter Robinson <pbrobinson@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] Makefile: Drop SPL_FIT_SOURCE support
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

On Sat, 05 Oct 2024 01:07:13 +0200, Marek Vasut wrote:

> The SPL_FIT_SOURCE is long superseded by SPL_FIT_GENERATOR which
> is long superseded by binman, drop SPL_FIT_SOURCE support as there
> are no more users.
> 
> 

Applied to u-boot/master, thanks!

-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
