Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 056145B9F67
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 18:11:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFFC9C0D2BF;
	Thu, 15 Sep 2022 16:11:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E360C03FE0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 16:11:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FFetYh011566;
 Thu, 15 Sep 2022 18:11:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=l2cNAyq7HqJtVSr7se9+neZq8UDt9hC66E2ti8YJE+M=;
 b=JbpuLUZGUaD0Fl8/QP7TRvv8R8az3fHiZJL7kJLX8SL2tq1DI9e411zp7b+xyXrRbNpa
 aaT4j+Ww7NsunN7I18h05coKR/c/ZX7mk5H4DxlENI9s8B2grOws+Sq9db1eKrSXbSB8
 eHkqfIzffAQHN2TILWDHUTKBLjmrMVOIuY2MevPWBi4AW0o9Cwxc4xyIv2ibHvmVpVxk
 wcnMo5R1iqATIzcoEcDPQ7n426v4lXL3Qw2ZiVuC17vz/P9DhfrtCS5olS3tvc5V2y4z
 mHVEtJttG19YvgYjLJq+AwDg0jO8Na1RujjxkAeEI6fm/7dJxI+L5rB6uo44qtutnQNh Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jjy07nsgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 18:11:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22D6410002A;
 Thu, 15 Sep 2022 18:11:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A23E235F18;
 Thu, 15 Sep 2022 18:11:48 +0200 (CEST)
Received: from localhost (10.75.127.123) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 18:11:47 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Sep 2022 18:11:37 +0200
Message-ID: <20220915161141.301299-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 0/4] arm: stm32mp: adapt the command stm32key
	for STM32MP13x
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


And support the 2 keys for STM32MP13x
- PKHTH : Hash of the 8 ECC Public Keys Hashes Table
          (ECDSA is the authentication algorithm)
- EDMK : Encryption/Decryption Master Key

Only one key is supported for STM32MP15x
- PKH : Hash of the ECC Public Key
        (ECDSA is the authentication algorithm)

This STM32KEY command is used in STM32MP SoCs to provision the
keys in the correct OTP needed to activate secure boot features:
authentication and encryption.

See [1] for details

[1] STM32 MPU wiki
https://wiki.st.com/stm32mpu/wiki/How_to_use_U-Boot_stm32key_command



Patrick Delaunay (4):
  arm: stm32mp: add defines for BSEC_LOCK status in stm32key command
  arm: stm32mp: introduced read_close_status function in stm32key
    command
  arm: stm32mp: support several key in command stm32key
  arm: stm32mp: adapt the command stm32key for STM32MP13x

 arch/arm/mach-stm32mp/cmd_stm32key.c | 331 ++++++++++++++++++++-------
 1 file changed, 249 insertions(+), 82 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
