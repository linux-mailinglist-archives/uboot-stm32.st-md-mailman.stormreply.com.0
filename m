Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B421830743
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jan 2024 14:43:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0FDFC6DD74;
	Wed, 17 Jan 2024 13:43:21 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F406CC6B457
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 13:30:46 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4TFRbB3QTYz9t2n;
 Wed, 17 Jan 2024 14:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1705498246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SY/fsLTL/eVFUMA50CfEZADIbUXjMby6WKSPAdGGDkk=;
 b=tjrjRR1ajG4clshVB9HMtyoCeK8eU00K/BoBzwDplNudQ2jg6FQvwOgGb21gyzCZO5WRDp
 US82UFVbgNH9DvR8xrlbuwLvMaXHHEIrV9t2HnPDubNYkP34mV458P3/rQFXe+pgQpB8GQ
 F88RSfKagvDVcXV5Fz6fJKbOaGHUnkLjV5TAVjdGgIZawvIuiuM5KrxXhZPiA25rI+LjuX
 eTfyPICsNHD+xofcrKgkg5+t6pYSfwU2kA/EzylRZHsMVpsEme+SSZOSvZulMy9jxcI26b
 xIzHii7CsANqSFSdy6KEKY2qpB25l8fEw5f07H5nbCXRyeq9UVR4I3zNx98HLw==
Message-ID: <2adbc4f0-69ad-4b08-bcf2-7427ae936d88@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1705498244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SY/fsLTL/eVFUMA50CfEZADIbUXjMby6WKSPAdGGDkk=;
 b=jqwkt2cYkQAp7sfs8JaNsjfAObTqbqAxNdOpyZI3eC2IzEJyfww0YRyzIutvagd24TZk/e
 5ok7w/nybjV9MxQ1MZ0Xy8RQn+uWsc9DZjl9AEy6W4FJY5PE4tOVaWva7PSIF4PTRxL+su
 dpEzLmpg/Jws0n4BpUsUTL2L6JwnW96jBeN9oFNWM5pXEX6il/3MsDrVz0PPyb/wP37lq7
 ehZ/pbRD7iLoHR04c7fziP7uXpupRPgy7HORqXLXYkqEK8tqTKO3yz4B0QZTnhWIiIuV4I
 ebFdv9wszrwzepnKO5eBfwkvJS0M3ua48t04SJegkgJrfmlEZbNemVjkcqO3qQ==
Date: Wed, 17 Jan 2024 14:30:41 +0100
MIME-Version: 1.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20240117123714.50380-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20240117123714.50380-1-patrice.chotard@foss.st.com>
X-MBO-RS-META: bgg3o35o4dwg74bo8um5q7cym673acuh
X-MBO-RS-ID: 932d97a21ee3ab02a6e
X-Rspamd-Queue-Id: 4TFRbB3QTYz9t2n
X-Mailman-Approved-At: Wed, 17 Jan 2024 13:43:20 +0000
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Bin Meng <bmeng@tinylab.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ion Agorria <ion@agorria.com>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2] common: console: Fix print complete
	stdio device list
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

On 1/17/24 13:37, Patrice Chotard wrote:
> In case CONSOLE_MUX and SYS_CONSOLE_IS_IN_ENV are on and
> stdin or stdout or stderr are missing in environment, as fallback, get
> these either from stdio_devices[std] or stdio_devices[std]->name.
> 
> Fixes: 6b343ab38d ("console: Print out complete stdio device list")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Yes, please, this is a good idea:

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
