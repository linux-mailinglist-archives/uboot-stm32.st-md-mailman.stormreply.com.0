Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2D81BDBE9
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 14:20:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6442CC36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 12:20:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68650C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 12:20:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TCIW9v007777; Wed, 29 Apr 2020 14:20:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=YQpb1nJJvl5XsZ1oFbbSGFGkimKyTtbRQq5UKXuUIOs=;
 b=cbxbiWC2BqeV7NBE0K2cuqy+iOtIFiaj2Jlv9tnAGmrTNrl8bdtxwrS9ADAstsTjxnIN
 j9e6NqnbK0iFhRk4KiEmN+R/3jWUZSFKLxdpOeVxNBMXGOKIQTeu/e70VLkTNr91purS
 K+Ls2k3Xw193bTygU/LVR3pVHPy7mK2FLnJ9+g6nDBS9VML8VXKfhPg4H0yF/poguXY6
 eduCVNvlQD0bCD8HZjX7IJI/+Rldn1a1R2FqSF7yrlWc7MgkZU/Sm43pABX8/YXhFU4s
 P08S7pp9usgTtrDlbPsTd2UyW78svazqTaaw3pHMfxdVbzAawYkeSn61Lbv4Za2CAjU+ 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq6695c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 14:20:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08ABB10002A;
 Wed, 29 Apr 2020 14:20:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D32EB212A70;
 Wed, 29 Apr 2020 14:20:34 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 29 Apr 2020 14:20:34 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 29 Apr 2020 14:20:26 +0200
Message-ID: <20200429122031.31279-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_05:2020-04-29,
 2020-04-29 signatures=0
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Alex Marginean <alexandru.marginean@nxp.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>,
 Dario Binacchi <dariobin@libero.it>
Subject: [Uboot-stm32] [PATCH v2 0/5] cmd: bind allow to bind driver with
	driver_data
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

 - fix the bind command
 - add a bind command test
 - add bind command documentation

Changes in v2:
   - add a bind command test
   - add bind command documentation in doc/driver/model/bind.rst
   - simplify patch 1 by using lists_bind_fdt()

Patrice Chotard (5):
  cmd: bind: allow to bind driver with driver data
  sandbox: phy: add driver_data for bind test cmd
  sandbox: dts: Add compatible string for bind-test node
  test/py: Update test_bind
  doc: add bind/unbind command documentation

 arch/sandbox/dts/test.dts  |  1 +
 cmd/bind.c                 |  5 +++--
 doc/driver-model/bind.rst  | 32 ++++++++++++++++++++++++++++++++
 doc/driver-model/index.rst |  1 +
 drivers/phy/sandbox-phy.c  | 18 +++++++++++++++++-
 test/py/tests/test_bind.py | 18 +++++++++---------
 6 files changed, 63 insertions(+), 12 deletions(-)
 create mode 100644 doc/driver-model/bind.rst

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
