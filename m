Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890A4A5B98
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Feb 2022 12:53:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 350CDC5F1EC;
	Tue,  1 Feb 2022 11:53:58 +0000 (UTC)
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [91.198.250.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9A16C597BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Feb 2022 11:53:56 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4Jp3HR3PqRz9sT7;
 Tue,  1 Feb 2022 12:53:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Message-ID: <6cb11226-1004-020b-edef-5fb84db2920a@denx.de>
Date: Tue, 1 Feb 2022 12:53:50 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20211203092744.24870-1-patrice.chotard@foss.st.com>
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20211203092744.24870-1-patrice.chotard@foss.st.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>
Subject: Re: [Uboot-stm32] [PATCH] mtd: cfi_mtd: populate mtd->dev with
	flash_info->dev
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 12/3/21 10:27, Patrice Chotard wrote:
> Populate mtd->dev with flash_info->dev which allows to get
> full mtd information using the "mtd list" command.
> Before, "mtd list" command returns :
> 
> List of MTD devices:
> * nor0
>    - type: NOR flash
>    - block size: 0x40000 bytes
>    - min I/O: 0x1 bytes
>    - 0x000000000000-0x000004000000 : "nor0"
> 
> After this patch we get for example:
> 
> List of MTD devices:
> * nor0
>    - device: flash@0
>    - parent: spi@40430000
>    - driver: cfi_flash
>    - path: /soc/spi@40430000/flash@0
>    - type: NOR flash
>    - block size: 0x40000 bytes
>    - min I/O: 0x1 bytes
>    - 0x000000000000-0x000004000000 : "nor0"
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot-cfi-flash/master

Thanks,
Stefan
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
