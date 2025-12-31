Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A866ACEC34E
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Dec 2025 16:53:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A2A9C57A52;
	Wed, 31 Dec 2025 15:53:30 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73766C0693F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 15:53:28 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dhDyG1Fn2z9sv9;
 Wed, 31 Dec 2025 16:53:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767196406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLlHHTuk/48kvrACvzFPo2peP+gHjeGf/tZgamez0EE=;
 b=N4m7MNGTixi1CEj2Mbc6Ug5sZey08dy82uH+yD39mh+InxnFUATLzzXzTUkCtHrzSRzf6w
 cbUsJS/L2PbxONFObsaFY9hYWyU1Yop4Qm6Z497+nQfaNvYMfHAktwm44gBKp9Yprbxl5x
 DNx0HiQq/m90m7a8+sUohg5/iHETwRM8z/XYGdpzAwonYNdxnQvMMaYgZYsMuWkv3ShoGG
 Fmpc+WaYL5O/L52wwSpyncH/GcTzHRc0Oq3ZTxprJF0aMqAD87jpKs20Q3nHjZsOnQtLDI
 Y4CG7enXYU3Pp+EUZ/Ld+RSKr4LCsvsEneMKo8FvvUTsnwzTmhI+Hu8tL6JZ7Q==
Message-ID: <f6140b6b-2dba-4bfe-bdf8-11a9793916ee@mailbox.org>
Date: Wed, 31 Dec 2025 16:53:23 +0100
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Peng Fan <peng.fan@nxp.com>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-3-d055da246e55@foss.st.com>
 <869f8843-8d43-4c1f-b6ae-0116fcf64ac4@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <869f8843-8d43-4c1f-b6ae-0116fcf64ac4@foss.st.com>
X-MBO-RS-META: tn5wpc4nfgksna7i85yj4aqwgmdoxxej
X-MBO-RS-ID: f38837e11efdf9c06a3
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] clk: stm32: Update clock
 management for STM32MP13/25
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

On 12/16/25 4:35 PM, Patrice CHOTARD wrote:

Hello Patrice,

sorry for the late reply.

>>   	/* WWDG */
>> -	STM32_GATE(CK_BUS_WWDG1, "ck_icn_p_wwdg1", "ck_icn_apb3", 0, GATE_WWDG1,
>> +	STM32_GATE(CK_BUS_WWDG1, "ck_icn_p_wwdg1", IDX_ICN_APB3, 0, GATE_WWDG1,
>>   		   SEC_RIFSC(103)),
>> -	STM32_GATE(CK_BUS_WWDG2, "ck_icn_p_wwdg2", "ck_icn_ls_mcu", 0, GATE_WWDG2,
>> +	STM32_GATE(CK_BUS_WWDG2, "ck_icn_p_wwdg2", IDX_ICN_LS_MCU, 0, GATE_WWDG2,
>>   		   SEC_RIFSC(104)),
>>   };
>>   
>>
> Hi Marek
> 
> Can you give this patchset a try on DHCOR board in SPL ?
I have bad news, the SPL does not even start with this, no output on 
UART even. The problem seems to be in 3/3 , if I apply only 1/3 and 2/3 
the board does boot just fine.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
