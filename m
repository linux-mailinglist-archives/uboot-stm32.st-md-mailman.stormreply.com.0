Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DB05B568F
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:47:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C04FC03FD5;
	Mon, 12 Sep 2022 08:47:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3390FC03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:47:20 +0000 (UTC)
Received: from [192.168.1.107] (82-131-156-25.pool.digikabel.hu
 [82.131.156.25])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A81BA84A2C;
 Mon, 12 Sep 2022 10:47:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1662972439;
 bh=S7ObU8zJYUQcFOe0g+1MRcREq2b7uzV1eqnWwk1Ai+0=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=0D0zOCqdxiDiLKVOCWP+V3FjwZQsXBZeQoVL1PqRqp4aAE6GNgwSdbBqdiWb8VBcL
 qHilYMWFsU2Z0ZyoHlUWmAusNPYAhr1Fl5pM47AWYdeskYQ1v/D+b3aJnRMvs/cFt/
 hOdcPWWMd8GFmiPKckdeNpJUtdf1BffISTZoPEqNv1mZnL+taegGhxKdHMgRKYq6EB
 xORf4iQuQmQ+J2oeu1SQN/sevQQL4PjRrj949isobK6KCaoORrCz6+1qZEOn5c4gn/
 De9fxwxi8QAlc5Z9TkHK7IAL+Ai3QgLLCl3MCzOhPiFJFvtAgc20Hz6U/qPdObWVa5
 HQNPoskuBA72Q==
To: Alain Volmat <alain.volmat@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-2-alain.volmat@foss.st.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <d3548f6b-aec2-f86f-fb26-9adb35921897@denx.de>
Date: Mon, 12 Sep 2022 10:47:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220912084201.1826979-2-alain.volmat@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io
Subject: Re: [Uboot-stm32] [PATCH v4 1/4] i2c: stm32: fix comment and remove
 unused AUTOEND bit
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Alain,

On 12.09.22 10:41, Alain Volmat wrote:
> Comment within stm32_i2c_message_start is misleading, indicating
> that AUTOEND bit is setted while it is actually cleared.
> Moreover, the bit is actually never setted so there is no need
> to clear it hence get rid of this bit clear and the bit macro
> as well.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>  drivers/i2c/stm32f7_i2c.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
