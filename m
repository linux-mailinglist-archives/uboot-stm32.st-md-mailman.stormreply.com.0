Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E26F05B56F5
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 11:10:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98D91C03FD5;
	Mon, 12 Sep 2022 09:10:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDCB8C03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 09:10:37 +0000 (UTC)
Received: from [192.168.1.107] (82-131-156-25.pool.digikabel.hu
 [82.131.156.25])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6DD5683FD6;
 Mon, 12 Sep 2022 11:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1662973837;
 bh=zhN7/1k6/3uFN1vyIe2XPIXzMQ2oR20UzBcZf9LrbGM=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=yvInRyq5KLCuHwMEPR5sT9TgS6PNjJuh8BL6WanqVGgfELMunY4dYPHqS6kG0f+FE
 bL8apyGB978nj5S3Ql03e/N6x0tBb7BRXDaS3zfFbpHus6j//uYo8x7ysULy4a1BsY
 OMHPHds+toh2aEOmXvKEJ8S/OSLZxZkG1MtFQNbkJe5K4Zb9FQ1A7mH7RaK/BvtD2/
 p9GLgDvWyxtr+9QSy8MA6mDd4R3mLaCO4xs4StuLsC2e379312rLfKyKwG4fu3ELvf
 VS07kg3GliXiSv5BETQzrRR6gfBH2bfHsor/HH467WvHtsHXuQ5YEPEIK0SWkNOtKn
 NtpyuPvMzX0bQ==
To: Alain Volmat <alain.volmat@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-5-alain.volmat@foss.st.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <c85ca87d-da7f-b576-0408-187db9d3f193@denx.de>
Date: Mon, 12 Sep 2022 11:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220912084201.1826979-5-alain.volmat@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io
Subject: Re: [Uboot-stm32] [PATCH v4 4/4] i2c: stm32: fix usage of rise/fall
 device tree properties
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

On 12.09.22 10:42, Alain Volmat wrote:
> From: Jorge Ramirez-Ortiz <jorge@foundries.io>
> 
> These two device tree properties were not being applied.
> 
> Fixes: 1fd9eb68d6 ("i2c: stm32f7: move driver data of each instance in a privdata")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/stm32f7_i2c.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

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
