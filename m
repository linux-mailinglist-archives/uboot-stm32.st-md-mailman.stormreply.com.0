Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D07623039E
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:13:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67D8CC36B27
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 07:13:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4219EC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 07:13:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S7D7U6031946; Tue, 28 Jul 2020 09:13:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=6g+WnMv8kCxSWIHpfhhBaRGfU5aVJnf8Jm93uoSaG9c=;
 b=1jGkrVNFjKRzjVfkmOxt6HhNUpptVk57LBkPYh51UYvzx1PMeWRPAorIefRGf0zR5+/R
 5QrFiueFV+voEidRmCWzCUtIVD8OVE/DuBNTinQrY8qUFaR/u12DJFGqn3bb3Y3QnNdj
 gQ3mTr69+i2RMTwwkH3Yz0xvS21UU8rE5WXzTvcLSW/C6iGjfSDds6HnCYzXmL3ATRTZ
 N5rGF+5JACZojp7AlBs/lXmn/BXmaZrfGbyNt1Hyn9Si+qNLMAmfxZa8bGQDzK7eXK2p
 O+RwRRaB3ca9VeI92L6SiEvVHeh+sEBDxALr/1XTaCc+xmVhypaOLXvggrLz72J4IATZ ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9d0cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:13:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E55A10002A;
 Tue, 28 Jul 2020 09:13:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D839721E690;
 Tue, 28 Jul 2020 09:13:39 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 09:13:39 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jul 2020 09:13:30 +0200
Message-ID: <20200728071335.5840-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-27,
 2020-07-28 signatures=0
Cc: Heiko Schocher <hs@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Simon Glass <sjg@chromium.org>, Walter Lozano <walter.lozano@collabora.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v5 0/5] cmd: bind allow to bind driver with
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

Changes in v5:
  - rebase on last master
  - fix phy test regression

Changes in v4:
  - fix make htmldocs error "Title underline too short"

Changes in v3:
  - fix typo
  - fix typo
  - fix typo
  - add bind/unbind parameters description and how to find them

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
 cmd/bind.c                 |  5 ++--
 doc/driver-model/bind.rst  | 49 ++++++++++++++++++++++++++++++++++++++
 doc/driver-model/index.rst |  1 +
 drivers/phy/sandbox-phy.c  | 18 +++++++++++++-
 test/dm/phy.c              |  2 +-
 test/py/tests/test_bind.py | 18 +++++++-------
 7 files changed, 81 insertions(+), 13 deletions(-)
 create mode 100644 doc/driver-model/bind.rst

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
