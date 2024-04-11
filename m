Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 451718A07E2
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Apr 2024 07:48:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E16C2C6C83C;
	Thu, 11 Apr 2024 05:48:28 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74F38C6C820
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Apr 2024 05:48:27 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43AMxAIb019645; Thu, 11 Apr 2024 07:48:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=cXM1XbFYXJh40vKbFgWIfMiUChz+/Nufuaeh1uJ/20Y=; b=hT
 3GSfidYSr51lUOEz77iB9bssDcejCzCW5sAxO1WyiM0fhUdD0Lxqkun9QbPAoBTk
 bqTvkftKjkfHF8p4dkqiuYN1YWOrca/ignU2Wbn3ft2lHrMEzIqf9P9CdeKZdAlS
 9kFIQ+VJJ4wpukCBVdJT+dU75IbSJFd5LltOIE03IORTbPXSwC7JpKT1siRMSg+I
 CkSxbE/O91o2B4DN/WffRpJjHTink+T1KqienIKrg54xB0RpeKQmcX21RuG2yUcS
 ARZ/bcxEclmo7t9AXey90TFqWW6QREmFFwnJtz2sGqxTzX9NnhCCc/Dq21QVLKe2
 CYjTijeMU6KQsXSRbTPA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xbhbj90be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 07:48:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6096D4002D;
 Thu, 11 Apr 2024 07:48:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BFD320D3FF;
 Thu, 11 Apr 2024 07:47:51 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 11 Apr
 2024 07:47:50 +0200
Message-ID: <ae3a97ee-94f4-49af-9335-e4d5beab59ba@foss.st.com>
Date: Thu, 11 Apr 2024 07:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>
References: <20240311143918.2927406-1-patrice.chotard@foss.st.com>
 <20240410152856.GA4170860@bill-the-cat>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240410152856.GA4170860@bill-the-cat>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_02,2024-04-09_01,2023-05-22_02
Cc: Udit Kumar <u-kumar1@ti.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
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



On 4/10/24 17:28, Tom Rini wrote:
> On Mon, Mar 11, 2024 at 03:39:17PM +0100, Patrice Chotard wrote:
> 
>> In case lmb_add_region_flags() is called with the same parameter than
>> an already existing lmb and this lmb is adjacent to its previous lmb with
>> different flag, this lmb is added again.
>>
>> Instead breaking the loop, continue, at the next iteration, we are able
>> to detect that this region already exist.
>>
>> Issue reproduced on STM32MP157-DK2 with SCMI DT, bdinfo command's output
>> shows:
>>
>> Before this patch, the last LMB [0xde000000-0xdfffffff] is duplicated:
>> ...
>> lmb_dump_all:nnn
>>  memory.cnt = 0x1 / max = 0x2
>>  memory[0]      [0xc0000000-0xdfffffff], 0x20000000 bytes flags: 0
>>  reserved.cnt = 0x6 / max = 0x10
>>  reserved[0]    [0x10000000-0x10045fff], 0x00046000 bytes flags: 4
>>  reserved[1]    [0x30000000-0x3003ffff], 0x00040000 bytes flags: 4
>>  reserved[2]    [0x38000000-0x3800ffff], 0x00010000 bytes flags: 4
>>  reserved[3]    [0xdaadf000-0xdfffffff], 0x05521000 bytes flags: 0
>>  reserved[4]    [0xde000000-0xdfffffff], 0x02000000 bytes flags: 4
>>  reserved[5]    [0xde000000-0xdfffffff], 0x02000000 bytes flags: 4
>> ...
>>
>> After this patch:
>> ...
>> lmb_dump_all:
>>  memory.cnt = 0x1 / max = 0x2
>>  memory[0]      [0xc0000000-0xdfffffff], 0x20000000 bytes flags: 0
>>  reserved.cnt = 0x5 / max = 0x10
>>  reserved[0]    [0x10000000-0x10045fff], 0x00046000 bytes flags: 4
>>  reserved[1]    [0x30000000-0x3003ffff], 0x00040000 bytes flags: 4
>>  reserved[2]    [0x38000000-0x3800ffff], 0x00010000 bytes flags: 4
>>  reserved[3]    [0xdaadf000-0xdfffffff], 0x05521000 bytes flags: 0
>>  reserved[4]    [0xde000000-0xdfffffff], 0x02000000 bytes flags: 4
>> ...
>>
>> Fixes: 59c0ea5df33f ("lmb: Add support of flags for no-map properties")
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series leads to CI failures:
> https://source.denx.de/u-boot/u-boot/-/jobs/814084
> 

Hi Tom

i will have a look at it , thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
