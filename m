Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 055FC21E7A1
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Jul 2020 07:41:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4F15C36B27
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Jul 2020 05:41:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 254A2C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 05:41:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06E5fdUr125841;
 Tue, 14 Jul 2020 00:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1594705299;
 bh=URz9Rjt+rgGXjZbhjW6Xje+0aWuStsLN3Rc+9pPN58A=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kwHil3Y941ybN4ckMD3bBY801C2p+EkQ84VWRTY+IEPnCqZ9wUbVGaQeqMoOOr5WP
 1eedI0PbZa+/p++Bcg9VJEkIJx3FXiYWskpO3p3ayHgsp1vzWiedW1MwpjtvuSOPdV
 1mUtZqFGUhRlTrzbARfImQ3WwkAFzU6COVoZtNZM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06E5fdsJ003494
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Jul 2020 00:41:39 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 14
 Jul 2020 00:41:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 14 Jul 2020 00:41:38 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06E5faxe091191;
 Tue, 14 Jul 2020 00:41:37 -0500
To: Patrick Delaunay <patrick.delaunay@st.com>, <u-boot@lists.denx.de>
References: <20200707122515.10278-1-patrick.delaunay@st.com>
From: Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <f3d9991e-73ee-ee81-dd6f-0c43a0afe741@ti.com>
Date: Tue, 14 Jul 2020 11:11:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200707122515.10278-1-patrick.delaunay@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: k3: use correct weak function name
 spl_board_prepare_for_linux
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



On 07/07/20 5:55 pm, Patrick Delaunay wrote:
> Replace the function spl_board_prepare_for_boot_linux by the correct
> name of the weak function spl_board_prepare_for_linux defined in spl.h.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>


Applied to u-boot-ti.

Thanks and regards,
Lokesh


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
