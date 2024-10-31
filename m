Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B04E69BBB94
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Nov 2024 18:19:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 737C3C7A825;
	Mon,  4 Nov 2024 17:19:24 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBFC2C78032
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 06:56:50 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43169902057so4791875e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 23:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730357810; x=1730962610;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v2LwUXhqQv+Iw+QMLEygAkyoahHnM8C9bSd5wJCtXjg=;
 b=WBWf+pvtflTInzZs+1hsxlJUu5Wy10GM1toULinlsfy/Q8Yu5k9Sy6ulrjhl5rjF9h
 ljKOmB2/SCV7CzuRICoNk8AMt8NDhhQ4eb+sksGZBE++fTGNZbekvhpN4zrtW6zLQOzA
 v7qBbpb/ON4fiBjHXbgvIk11utCEhDWi81G7r11J5Y1IHb/DClG2ks1/koCQnE7ZORRu
 MzTYp3gsSMXWc9JSSylpwIj4tjyjVvh0h9F+TeG2Csa+xoX4SaKKsopn7Q8fIlnrPAX7
 YiuW6rmns6lrpgPH7777sq+3CmYdsqs7u0kXaGIVZkl82/Nx4rwQ7XkOlX5uBnPDxI9h
 pBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730357810; x=1730962610;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v2LwUXhqQv+Iw+QMLEygAkyoahHnM8C9bSd5wJCtXjg=;
 b=Jzu5azAC5A89Qqe0j2pBL20hGfthM269jmXL7R2pgyBrq90FD97Lhi4jbsBzqiHEcF
 a+TE5MDK9EP0GM4LUZGob+lRDbIWsiEvjMQPRoNo+zaTP3SuH3u3yZFFsfjFfRayEuhF
 R8+JdLVzh7pwRJwnU6BIfjnx1GbsO8swL4U535pFnUNlxXXBeXZ90qv7nendl6y9JRQA
 REpkm2m4czvFncEdlw53MZ+H++UNx7ybCrGqiqs4gQ6KxA0sHMAWY9Eo78dpz6UBlYXP
 Ds2htiJ6wAm0AXmXLonVVUKyetyTX6spIEANNhvg8ntntRugdmQZdZmhSAy1VSQwme2j
 bB3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxnkFuyQG74caUrTqn0V6j0PNDkfkulaemSsuGRJJJWa6u033vYGyQFVg7KA6i7Gk/Yi0aIlvbQhUbOQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDG0T9Zq+CO3lxfp6eYpd9fAmCcBH8EmdXGqdJjavIdtZ+twZ8
 evbFRbysVuL//Z+jseZ59t9j1U7VNNy5rvLnN9ESYFWvkjiYVT41sYWmZxB40K8=
X-Google-Smtp-Source: AGHT+IG5aPFteT9oL2BJv7UwEufN5PlIyp4QCG4DDIW6OgkSu3oeHpjI3uckuBiqFQd+JkXa+ARQpg==
X-Received: by 2002:a05:600c:4da4:b0:431:5d89:6465 with SMTP id
 5b1f17b1804b1-431bb9e6016mr53370845e9.34.1730357810379; 
 Wed, 30 Oct 2024 23:56:50 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd910357sm44507335e9.11.2024.10.30.23.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 23:56:48 -0700 (PDT)
Message-ID: <f5e21529-00ce-4eb1-b606-e300cd4d6e74@linaro.org>
Date: Thu, 31 Oct 2024 06:56:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michal Simek <michal.simek@amd.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
 <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
 <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
 <f797cb27-84ca-41c3-83a5-b9044f2d5e5c@linaro.org>
 <3835b139-ae37-423e-8a24-a958ece69c0d@amd.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <3835b139-ae37-423e-8a24-a958ece69c0d@amd.com>
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:19:22 +0000
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/9] mtd: spi-nor: Remove recently added
 nor->addr_width == 3 test
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

Hi, Michal,

On 10/30/24 3:20 PM, Michal Simek wrote:
> Jagan is aware that we are using this configuration for quite a long
> time and we are still here and not leaving.

Okay, great. Would be good if you/your team can allocate time and
review/test patches that are improving/fixing the stacked/parallel bits.
Help in reviewing other SPI NOR bits is appreciated as well.

> As you know Amit is trying to find a solution in Linux but nothing has
> been agreed yet. If there is agreement to separate it to own driver or
> so we will be definitely working with u-boot to get it to the same state.

Okay, thanks!
ta
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
