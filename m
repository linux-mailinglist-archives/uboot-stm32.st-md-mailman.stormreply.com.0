Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 854351B7DBF
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 20:21:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AC46C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 18:21:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F491C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 18:21:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OICqlU021117; Fri, 24 Apr 2020 20:20:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=XR3K7nSNYXUuRVPBwLI6UsGVR0wUezlp3JE6Xpr+oF8=;
 b=EVcSZ4w0UmIFdb9DsIH45VmxhHxo8Cum1RqWBrac2+gXi4j99/ljEAlmfT4mAvIxzADx
 U5k/M5kVaRx7f0zPjrgvjNwYQRYhtEVUYH9yQZK554m8LSRNsFrB51oWauZ0UGR/pg0F
 +J5boW/PBr79cBFSD3OJALnGRS19WxO9qZDCz/AittTilVD/kfl4/zoGLLSOchvYZuJu
 qRgRMCI3tbOEIwu2Z3JjJZbrVZZ77ES/Tqohr6zYt1cJ0M5PFmFxTrR4rZDMmVYMhR5p
 jMn7Y2cw5iI0gMEnORxDAr1urZIYz+lRL+B3fTve4LSwB4bZDsZUSb69JlEvaA27h+Pc 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp9d5m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 20:20:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5242D100034;
 Fri, 24 Apr 2020 20:20:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 365FF2CF9BD;
 Fri, 24 Apr 2020 20:20:57 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Apr 2020 20:20:56 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Apr 2020 20:20:14 +0200
Message-ID: <20200424182017.11852-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_09:2020-04-24,
 2020-04-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 0/3] arm: caches: allow to activate dcache
	in SPL and in U-Boot pre-reloc
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


Hi

It is a V2 serie after Marek feedback for
http://patchwork.ozlabs.org/project/uboot/list/?series=168378

This serie allows dcache activation in SPL or in U-Boot preloc stage
for ARM board.

See "arm: stm32mp1: activate data cache in SPL and before relocation"
for example of usage in SPL and in U-Boot pre-reloc of the function
dcache_enable() and of mmu_set_region_dcache_behaviour().

A branch named "dcache" with the needed patches for stm32mp1 boards
is available in:
https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git


Changes in v2:
- update patch after Marek's proposal. but I just divided by 2 instead
  of 4kB (minimal MMU page size)

Patrick Delaunay (3):
  arm: caches: protect dram_bank_mmu_setup access to bi_dram
  arm: caches: add DCACHE_DEFAULT_OPTION
  arm: caches: manage phys_addr_t overflow in
    mmu_set_region_dcache_behaviour

 arch/arm/include/asm/system.h |  8 ++++++++
 arch/arm/lib/cache-cp15.c     | 20 ++++++++++----------
 2 files changed, 18 insertions(+), 10 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
