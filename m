Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E11BFE46
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 16:30:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 874D3C36B0E
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 14:30:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AE20C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 14:30:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03UESVmb021801; Thu, 30 Apr 2020 16:30:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=wl5+RxCn3IjAsfW2F3naS6Rqodp6p6151dKVNV1LaMI=;
 b=btihYyzEsPeQOYf+Jxi1XQD82biidBt4mqRGTr92XlIaNJ3p5yjGX3ZJR5gPXDuTzepz
 oo1wVHUC8tUvliCzZoMuJ7ZqTQMiM3bcDpYUfD6ps0QThUjDIb9s6oNqSoOIYQAt2eKe
 PrgGHRJFg+4IaJt3e9YK5Il3fK2rVI0x6cEUIPHYffUW/KkRHN4yBhslfICMz9QvSGNd
 gsg7RvvnbR3oNNDjpncfZhGmQRj2nsFhJfBM8Yq+cJ71duwQEzgLq7O4ptFuMIO9NJGa
 5eSv0XZGvlCWIloMm0Sj68CX+UoofLQVDZfyYWv1YKSkT03+Vuuvhv1zyoLQDHycbSWz Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq6cy69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 16:30:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDF2410002A;
 Thu, 30 Apr 2020 16:30:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD1B421FE98;
 Thu, 30 Apr 2020 16:30:23 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Apr 2020 16:30:23 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Apr 2020 16:30:19 +0200
Message-ID: <20200430143021.3636-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_09:2020-04-30,
 2020-04-30 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v4 0/2] arm: stm32mp1: activate data cache in
	SPL and before relocation
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


V4 = cosmetic update of the previous serie V3
"arm: stm32mp1: activate data cache in SPL and before relocation"
http://patchwork.ozlabs.org/project/uboot/list/?series=172557

This serie depends on the ARM cache serie:
"arm: caches: allow to activate dcache in SPL and in U-Boot pre-reloc"
http://patchwork.ozlabs.org/project/uboot/list/?series=172555

I move tlb in .data section and simplify the implementation by reusing
the default weak function dram_bank_mmu_setup() for MMU configuration
and mmu_set_region_dcache_behaviour() to setup the specific behavior.

I also activate data cache on DDR for SPL.

For information the gain of the second patch is limited (few ms) for boot
from SDCARD: the SDMMC IP use internal DMA and data cache on DDR is
not really used.

Gain should be better for other boot use-case.

Example of bootstage report on STM32MP157C-DK2, boot from SD card.

1/ For trusted boot chain with TF-A

a) Before

    STM32MP> bootstage report
    Timer summary in microseconds (9 records):
           Mark    Elapsed  Stage
              0          0  reset
        583,290    583,290  board_init_f
      2,348,898  1,765,608  board_init_r
      2,664,580    315,682  id=64
      2,704,027     39,447  id=65
      2,704,729        702  main_loop
      5,563,519  2,858,790  id=175

    Accumulated time:
                    41,696  dm_r
                   615,561  dm_f

b) After the serie

    STM32MP> bootstage report
    Timer summary in microseconds (9 records):
           Mark    Elapsed  Stage
              0          0  reset
        583,401    583,401  board_init_f
        727,725    144,324  board_init_r
      1,043,362    315,637  id=64
      1,082,806     39,444  id=65
      1,083,507        701  main_loop
      3,680,827  2,597,320  id=175

    Accumulated time:
                    36,047  dm_f
                    41,718  dm_r

2/ And for the basic boot chain with SPL

a) Before:

    STM32MP> bootstage report
    Timer summary in microseconds (12 records):
           Mark    Elapsed  Stage
              0          0  reset
        195,613    195,613  SPL
        837,867    642,254  end SPL
        840,117      2,250  board_init_f
      2,739,639  1,899,522  board_init_r
      3,066,815    327,176  id=64
      3,103,377     36,562  id=65
      3,104,078        701  main_loop
      3,142,171     38,093  id=175

    Accumulated time:
                    38,124  dm_spl
                    41,956  dm_r
                   648,861  dm_f

b) After the serie

    STM32MP> bootstage report
    Timer summary in microseconds (12 records):
           Mark    Elapsed  Stage
              0          0  reset
        195,859    195,859  SPL
        330,190    134,331  end SPL
        332,408      2,218  board_init_f
        482,688    150,280  board_init_r
        808,694    326,006  id=64
        845,029     36,335  id=65
        845,730        701  main_loop
      3,281,876  2,436,146  id=175

    Accumulated time:
                     3,169  dm_spl
                    36,041  dm_f
                    41,701  dm_r

    STM32MP> bootstage report
    Timer summary in microseconds (12 records):
           Mark    Elapsed  Stage
              0          0  reset
        211,036    211,036  SPL
        343,393    132,357  end SPL
        345,645      2,252  board_init_f
        496,596    150,951  board_init_r
        822,256    325,660  id=64
        858,451     36,195  id=65
        859,153        702  main_loop
      3,414,706  2,555,553  id=175

    Accumulated time:
                     3,132  dm_spl
                    36,005  dm_f
                    41,695  dm_r


Changes in v4:
- fix commit message and comment and add Patrice Chotard reviewed-by
- fix commit message and add Patrice Chotard reviewed-by

Changes in v3:
- add Information in commit-message on early malloc and .BSS
- remove debug message "bye"

Changes in v2:
- create a new function early_enable_caches
- use TLB in .init section
- use the default weak dram_bank_mmu_setup() and
  use mmu_set_region_dcache_behaviour() to setup
  the early MMU configuration
- enable data cache on DDR in SPL, after DDR controller initialization
- new

Patrick Delaunay (2):
  arm: stm32mp: activate data cache in SPL and before relocation
  arm: stm32mp: activate data cache on DDR in SPL

 arch/arm/mach-stm32mp/cpu.c | 43 ++++++++++++++++++++++++++++++++++++-
 arch/arm/mach-stm32mp/spl.c | 19 ++++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
