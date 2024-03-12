Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FF8879341
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 12:45:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D25BC6C855;
	Tue, 12 Mar 2024 11:45:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04316C6C83C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 11:45:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42C7rlAx011638; Tue, 12 Mar 2024 12:45:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=OCOBHxPAVfRUihThgmKQ59aQEQl5mxLkzFxkXkHBMBs=; b=Zg
 oyaAt+uoz8Ahog2V8TIhWCG9M/3d0mPzMXadaiIDGwL237WOZgrCmGLrndWPDu8f
 273SxzWnSh2Ofwo+35a504YjpndtAAzbFYl4VAL+j+txtPv5NrrVbQnip0KC+ufv
 VKKs6VJyeG6Xq8TeaGA2XTDIb5TIlk1jiz8ti7vLFyYTADVNQVpMNjTUef9iKTw+
 6NHo3NDF7NbgPwP8OAycW6rg4PZnUdz7/2K2dZ1jZrNVjoJ9ED2Y+zbfFzkq352u
 FsOItnq8UPPwog2SFxuc0/VXP7zDKUxY1peVwyhEDIwk2UjglYXmrUNiGvsmqgt8
 mu/+uEn4MZLltnfOOhqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wrg02n24h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Mar 2024 12:45:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7B8414002D;
 Tue, 12 Mar 2024 12:44:55 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 98F0726029A;
 Tue, 12 Mar 2024 12:44:17 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Mar
 2024 12:44:17 +0100
Message-ID: <8a4d380a-4f87-407a-afa0-6a2786a6e527@foss.st.com>
Date: Tue, 12 Mar 2024 12:44:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>
References: <20240311193211.GA4582@francesco-nb>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240311193211.GA4582@francesco-nb>
X-Originating-IP: [10.201.20.71]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-12_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Udit Kumar <u-kumar1@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Kumar Gala <galak@kernel.crashing.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lmb: Avoid to add identical region in
 lmb_add_region_flags()
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



On 3/11/24 20:32, Francesco Dolcini wrote:
> Hello Patrice,
> 
> On Mon, Mar 11, 2024 at 03:39:17PM +0100, Patrice Chotard wrote:
>> In case lmb_add_region_flags() is called with the same parameter than
>> an already existing lmb and this lmb is adjacent to its previous lmb with
>> different flag, this lmb is added again.
> 
> Is this
> 
> On Mon, Mar 11, 2024 at 03:39:18PM +0100, Patrice Chotard wrote:
>> In case a new region is adjacent to a previous region with
>> similar flag, this region is merged with its predecessor, but no
>> check are done if this new added region is overlapping another region
>> present in lmb (see reserved[3] which overlaps reserved[4]).
> 
> or this, related to some
> 
> ERROR: reserving fdt memory region failed
> 
> message in your opinion?
> 
> More details in https://lore.kernel.org/all/fe9431c5-6806-1b7a-f9f4-dbe97ee13bba@toradex.com/

Hi Francesco

I observed also "ERROR: reserving fdt memory region failed" on STM32MP1 platform,
the issue was fixed using efi_add_memory_map() as done in this patch :

https://patchwork.ozlabs.org/project/uboot/patch/20240308101230.2595220-1-patrice.chotard@foss.st.com/

Thanks
Patrice

> 
> Francesco
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
