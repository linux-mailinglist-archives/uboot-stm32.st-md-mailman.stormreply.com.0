Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF5CD0B77
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Dec 2025 17:04:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E3CDC87EDF;
	Fri, 19 Dec 2025 16:04:37 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A929C87EDE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 16:04:35 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dXsmf545pz9tFB;
 Fri, 19 Dec 2025 17:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1766160274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ExuCH3vLVGZ8mghaEiGtpr6f5wMOpQ6t2FFVHCCV+s=;
 b=g5x3zIk84w8eu+313CVZPZTPxCqhLjCZjdsM8euU88Km8gKgttM5ZdnxMjhZ0TRQMtnMcb
 TZwbOBPpSRl1WFiZZXo9mIyScboDpbuQ0sDTaXnV4YvRFXvG9ySV4a0qD9Tt5H++Xs4k/X
 SfMZH3b5QIkWaybkY3bCp7W23RgaPZ/Y9kodT0o9F+/Ke+cZybJfzasI4Ua24YHDGch5/C
 +IFigUQ9UqPF3LGb9xgx9ctQg3y1LDolprwMtW8+no3JM/EtsW3++yz/RTkuuFhTRfBVga
 JtH61U3VomGs28DR9WjNdf89Ve3JsXXRH/kJeBJ8dtnQNfa+8EC9AYEpuXFykA==
Message-ID: <f1cee217-9d40-40a4-844b-5c08ea847695@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1766160272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ExuCH3vLVGZ8mghaEiGtpr6f5wMOpQ6t2FFVHCCV+s=;
 b=NX1zajw27hFk8nTCoDoIpoZOIc2PN9tsgDFNDzsnWKMVTkJ077P1T918p+BohAso0aMisB
 zXCGQe3bpEf8v73DOw+DA4sZFsKhoJCWzCwFu9NzCPOX4BIfVsMfWKEYrkg7NOePz4qG2N
 qunGn/5L3gd0hE10srUu3+d/rRYoKFpuuBCf4PHKIBOXIjGpj148lIJ6friu/k49oo7Qu+
 xRRKQ6DZznQu/DNwYr+8Zorh9ZKonWCzK/Rm1I10DdvlulHcNPoiZfVxMFBAdTxv6gUvsV
 SFCFQgT844oRKXc5BMGp8JwTbuhXwIvnf8tPxDksWq99nJW+Mszt3QmP+5jJyQ==
Date: Fri, 19 Dec 2025 17:04:28 +0100
MIME-Version: 1.0
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-3-d055da246e55@foss.st.com>
 <f4cb1c18-fb8c-49f8-9cf6-8136918e7a30@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <f4cb1c18-fb8c-49f8-9cf6-8136918e7a30@foss.st.com>
X-MBO-RS-ID: 09ee471e6d7404b63b7
X-MBO-RS-META: bkchiy88eqats8hhnn9utx4z4h1bqkbn
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>,
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

On 12/19/25 2:55 PM, Gabriel FERNANDEZ wrote:
> Hi Patrice,
> 
> You can add my : reviewed-by Gabriel FERNANDEZ 
> <gabriel.fernandez@foss.st.com>
The tag has to be on a new line, else PW won't pick it up.
Also, it is Reviewed-by: ...
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
