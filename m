Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8BCD0B47
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Dec 2025 17:03:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9FBEC87EDF;
	Fri, 19 Dec 2025 16:03:46 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ECD1C87EDE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 16:03:45 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dXslh4yrnz9tZT;
 Fri, 19 Dec 2025 17:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1766160224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CEx4bb+ld2jJmAuAjG2IzDeYRLThSkGR1P1Fr2lMHSg=;
 b=Fw0vlhHHt6aGISwMqnUK5hc/0UToaH1MJQOOTSo/HWSh5HfE408Z8tYHLnylRbFbXoNKXX
 ETaEeNExvYpETsGk5MNnZQjuSqnXI2N4ILGqPGb3zov9VtFL6fIncKtftua/t+WLc0AX0S
 hCWBF/KNjDhBiGEZbbV0nL7VBTUT0k1npkLqhoauQ91vwv8YzRmlskATH7cedwXSHRxxij
 jFDbuE1Vpi0Criq2jvKy8mRKh+s+Ng/GDUpnMdGrWFssKnuOEA/bb+CR/Gw9v1JUYCK/dg
 8OK/YrIDZQHN9OquNucnnGIKgOsl006ldvh0az3sMJKR4BWy/r0e1VgHAbfADA==
Message-ID: <7f8eb7fd-c503-41ce-9beb-9b247e91671b@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1766160222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CEx4bb+ld2jJmAuAjG2IzDeYRLThSkGR1P1Fr2lMHSg=;
 b=N+pEdwpZUdBTkjRpmbdOYWRjPxc0Y8CJEAs/NXTUs0IaLfnaUg8M8imYdRLwfBXWhQJtEk
 0SGZiCFZyc1InRCKan4L57euJXlPFWsUBLVgJWYwILCOSAqrVM11GokvLNvOEcTOzOA/xH
 5Dm+XlbtNf2L8HhISenfRgAKzYaImsBeA7IhS7A6qKbM2oKpXE5mxpV2Rm00St/1mnhIIc
 k5wvxOiUZ10rHyKpfo945ylEcncKKzNhas7jyN7OqCnRX1UZuGaNsfE37S5kE6aCrHm1M+
 /SVF2LsVUuiPscZE0VZ+sUaFNHXXUfW+iQVGlb53NcH6eXhDXEIBEW2hST3H1g==
Date: Fri, 19 Dec 2025 17:03:37 +0100
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <1cbe447d-dac1-4dcb-9a96-51c4ee0bcf3e@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <1cbe447d-dac1-4dcb-9a96-51c4ee0bcf3e@foss.st.com>
X-MBO-RS-ID: 6e5cd7a2ebb6b31dfda
X-MBO-RS-META: sznu8ijuuesixn5ip8f9d9mwqj5jxofi
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] Restore boot for
	STM32MP13/STM32MP2 board family
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

On 12/19/25 2:42 PM, Patrice CHOTARD wrote:
> Hi Marek

Hello Patrice,

> Can you give this patchset a try on STM32MP13 DHCOR board in SPL ?
I have it on my list of things to do.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
