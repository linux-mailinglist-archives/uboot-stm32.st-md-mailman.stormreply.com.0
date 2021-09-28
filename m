Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C363141A8FB
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Sep 2021 08:30:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7438FC5AB62;
	Tue, 28 Sep 2021 06:30:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B0A5C5A4D0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 06:30:09 +0000 (UTC)
Received: from [192.168.1.107] (82-131-156-90.pool.digikabel.hu
 [82.131.156.90])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7239480C58;
 Tue, 28 Sep 2021 08:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1632810608;
 bh=kO5mmS4lJjAf9uajyCaNkiI+dv7CwY2FQ/gsV3whkJ4=;
 h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
 b=emm1J10FJBcNEelwrkvE3W7+MQQ9yU1TOKa0b7LT5owXGWRiaGYJha4lHi8eg39yk
 nWc29kD7wWrSyoNxzdUUuYVqp7XUV2aL2cWoMmGLeKuWqDzN6hwRwCibgUm9QGTegf
 mJZ6BfyfiQydTWYIhkkB2k/PdtkPAOhHB++mKhBjUtqm3CwfiwN4VYkWQWlbURhfA5
 NZob8Haa1TFzR8I/KN1Gir8BO9qWmfYkpOvDlCh0LwbXRzpb46/GoKnoDRahpQ0mLO
 enwSB2LlmoJCPpRj0BkapXvCH2LVjrnxBgqvjgwX1grRbY2ZfoCY+vRDfQPIuH9AR+
 d5zFvtH+AWieQ==
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20210913142553.24333-1-patrice.chotard@foss.st.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <0e5077de-9765-2bd3-1938-ae6382b06929@denx.de>
Date: Tue, 28 Sep 2021 08:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210913142553.24333-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Farhan Ali <farhan.ali@broadcom.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] mtd: nand: raw: convert nand_dt_init() to
 ofnode_xx() interface
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

Hello Patrice,

On 13.09.21 16:25, Patrice Chotard wrote:
> nand_dt_init() is still using fdtdec_xx() interface.
> If OF_LIVE flag is enabled, dt property can't be get anymore.
> Updating all fdtdec_xx() interface to ofnode_xx() to solve this issue.
> 
> For doing this, node parameter type must be ofnode.
> 
> First idea was to convert "node" parameter to ofnode type inside
> nand_dt_init() using offset_to_ofnode(node). But offset_to_ofnode()
> is not bijective, in case OF_LIVE flag is enabled, it performs an assert().
> 
> So, this leads to update nand_chip struct flash_node field from int to
> ofnode and to update all nand_dt_init() callers.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  drivers/mtd/nand/raw/denali.c          |  2 +-
>  drivers/mtd/nand/raw/mxs_nand.c        |  2 +-
>  drivers/mtd/nand/raw/nand_base.c       | 27 +++++++++++---------------
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c |  2 +-
>  drivers/mtd/nand/raw/sunxi_nand.c      |  2 +-
>  include/linux/mtd/rawnand.h            |  6 +++---
>  6 files changed, 18 insertions(+), 23 deletions(-)

Applied to u-boot-i2c next

Thanks!

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
