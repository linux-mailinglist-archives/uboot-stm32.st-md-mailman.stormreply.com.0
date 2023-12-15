Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EDA815164
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Dec 2023 21:48:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84180C6DD6D;
	Fri, 15 Dec 2023 20:48:51 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7572CC6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 20:48:50 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-42608498274so8306721cf.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 12:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702673329; x=1703278129;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jXkQvGvseRr9OSLhDEpKNiBne6PE2K/af+l97pnxyM=;
 b=NSQ+hlSA22gCJwJoMJSOvhy4mZjMBTedmqt81tiuDPg+C57C1BxXH+XrrCu3BZ8OTz
 kmxwzLPmMOit5pL4TKq4MmNB1+UhH1imwqYtxfJgU7qnwZ4ve5NKtW/lINxl5irmyEs0
 WdfZTY7F9bUGBMr9Qx4eMT0uTWaRh9K1VcSStvicFJtfIdeTuP764xL/4wgyAMjEjxqQ
 GCIIfm5/lXS6uJOuDL6HmYa9zoVGuhRVUi+QjuWUQ62GH8lHeFJ+/W3qagsigYT/3aJp
 4c4v/uDY5mNLj7/IDaYrcT2/JvPoruUBWjF15YFyhZFCTJA2TuouztUpkfXRb76sUTG7
 vrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702673329; x=1703278129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jXkQvGvseRr9OSLhDEpKNiBne6PE2K/af+l97pnxyM=;
 b=HrIxHeBE4kzq9jgHYK67PYbBjKAQQ8nU5+DHQVYGZPM069imEhCcjqBncQL+MpIJI4
 v5OpdsLa0IgF57BDttkTNf/MRfrkG6AE1bdkQXIkhjKiCweNN7gZQf9L3CAeFhKhsqyk
 1GqNF1b5bIO1rDjefYPjeHrhcB+m/e3MDgw17kNyNzUJXteUmJfoVf0PWkJtyEhDh3u6
 yj/1ydoh35TGaVlz4P8NmKVHqutaGXe0cjkJ3TrpRqN5/sGKsqKmg/FUbbj6pirzARqO
 WfDPAvFiBzNdUUw/fljmD4pwdV7DGZINx/DaxPBg4I8y+gmLmI9BhR1iuV015LM+PPWT
 4Low==
X-Gm-Message-State: AOJu0YyBSL88axyCzNrTE+J8iKFmgzh1rh5gqUZihx4SxbRWkx9j9gMH
 jlROOt4CG6FRjsXkdbX2E4E=
X-Google-Smtp-Source: AGHT+IFh0KB6Ddcmip2ygFoybmhbuqRp+r9fRO8MZjby6AGfEX+H07Qa3nzASYtL43r0h9ISZE904w==
X-Received: by 2002:a05:622a:11cb:b0:425:4043:18a0 with SMTP id
 n11-20020a05622a11cb00b00425404318a0mr21132014qtk.83.1702673329488; 
 Fri, 15 Dec 2023 12:48:49 -0800 (PST)
Received: from localhost (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with UTF8SMTPSA id
 z4-20020ac875c4000000b004180fb5c6adsm6908123qtq.25.2023.12.15.12.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Dec 2023 12:48:49 -0800 (PST)
From: Sean Anderson <seanga2@gmail.com>
To: u-boot@lists.denx.de, daniel.schwierzeck@gmail.com, michal.simek@amd.com,
 sr@denx.de, neil.armstrong@linaro.org, patrice.chotard@foss.st.com,
 ivprusov@sberdevices.ru, Lukasz Majewski <lukma@denx.de>,
 patrick.delaunay@foss.st.com, ryan_chen@aspeedtech.com,
 chiawei_wang@aspeedtech.com
Date: Fri, 15 Dec 2023 15:48:32 -0500
Message-Id: <170267330672.2421617.16500568591017689149.b4-ty@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20231109105516.24892-1-ivprusov@sberdevices.ru>
References: <20231109105516.24892-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
Cc: BMC-SW@aspeedtech.com, u-boot-amlogic@groups.io,
 uboot-stm32@st-md-mailman.stormreply.com, joel@jms.id.au,
 kernel@sberdevices.ru, Sean Anderson <seanga2@gmail.com>, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v7 0/8] clk: Switch from soc_clk_dump to
	clk_ops function
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

On Thu, 9 Nov 2023 13:55:08 +0300, Igor Prusov wrote:
> Currently clock providers may override default implementation of
> soc_clk_dump function to replace clk dump command output. This causes
> confusing behaviour when u-boot is built with one of such drivers
> enabled but still has clocks defined using CCF. For example, enabling
> CMD_CLK and using clk dump on sandbox target will not show CCF clocks
> because k210 driver overrides common soc_clk_dump.
> 
> [...]

Applied, thanks!

[1/8] clk: zynq: Move soc_clk_dump to Zynq clock driver
      https://source.denx.de/u-boot/custodians/u-boot-clk/-/commit/bdac75511411
[2/8] clk: ast2600: Move soc_clk_dump function
      https://source.denx.de/u-boot/custodians/u-boot-clk/-/commit/3f192541df79
[3/8] clk: k210: Move soc_clk_dump function
      https://source.denx.de/u-boot/custodians/u-boot-clk/-/commit/77beaad3d1d2
[4/8] clk: amlogic: Move driver and ops structs
      https://source.denx.de/u-boot/custodians/u-boot-clk/-/commit/4f48202ba82e
[5/8] clk: Add dump operation to clk_ops
      https://source.denx.de/u-boot/custodians/u-boot-clk/-/commit/505ef5f627d8
[6/8] cmd: clk: Use dump function from clk_ops
      https://source.denx.de/u-boot/custodians/u-boot-clk/-/commit/258c1002383e
[7/8] clk: treewide: switch to clock dump from clk_ops
      https://source.denx.de/u-boot/custodians/u-boot-clk/-/commit/bc3e313ff6af
[8/8] cmd: clk: Make soc_clk_dump static
      https://source.denx.de/u-boot/custodians/u-boot-clk/-/commit/5666558a6cb0

Best regards,
-- 
Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
