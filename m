Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CAA573509
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jul 2022 13:13:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB08C640FE;
	Wed, 13 Jul 2022 11:13:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19086C640FC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 11:13:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26D8a0a3023208;
 Wed, 13 Jul 2022 13:13:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=GQ4OfymUlSzM68mtOPdM6WUqP0O3o3YPntUqGOgh8Jc=;
 b=mUdVNRxnkkw/7Rdpb8fFMb85CekmD+qVaOIM+dGx7jrn2BPvr9QFJwQDv0mGihL/OmO/
 pi6CZFnhYs5iNJ1Qzk2inIMusQ90Bj5l/7fbbKnq2GcWMWT+LJEvhkklUnZUr6r222Ho
 P4SrhZ1lodiknnj9cKDCRREAKSuKqGMAg/1GhoDefmuniwcDlaZd7phijvz2L7JW3CBp
 cRVUFuwobqN4BfgoUtohhRGqdZymwV59cYXe9hpu1Sor5avfes3E6LC5CZ5foWEEU+b9
 HEXc1VNetcIA7VzYl7Zi9neGm/tfH3yMgEdPaNorwxFkMVAR4ORULJ2DWyH/A3trPsG3 gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h94gughxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:13:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62C3210002A;
 Wed, 13 Jul 2022 13:13:03 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C07821B52C;
 Wed, 13 Jul 2022 13:13:03 +0200 (CEST)
Received: from localhost (10.75.127.44) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Jul
 2022 13:13:02 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>, Johann Neuhauser <jneuhauser@dh-electronics.com>
Date: Wed, 13 Jul 2022 13:12:50 +0200
Message-ID: <165771069387.1352308.13904600622040309109.b4-ty@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630141949.10585-1-jneuhauser@dh-electronics.com>
References: <20220630141949.10585-1-jneuhauser@dh-electronics.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-13_02,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp1: Drop fastboot and
	stm32prog trigger gpios on DHCOM
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

On Thu, 30 Jun 2022 16:19:48 +0200, Johann Neuhauser wrote:
> PA13 and PA14 are used for USB power control and can't be used
> to enforce fastboot or stm32prog mode by pressing a button.
> 
> Defining CONFIG_FASTBOOT/CONFIG_CMD_STM32PROG without this patch applied
> results in fastboot/stm32prog always starting, because PA13/PA14 are always
> low during boot. So drop the wrong trigger gpios definitions.
> 
> [...]

Applied to stm32/master, thanks!

[1/1] arm: dts: stm32mp1: Drop fastboot and stm32prog trigger gpios on DHCOM
      commit: 48d9eaf6826a1816c5f9839a564ea6338da609a7

Best regards,
-- 
Patrick Delaunay <patrick.delaunay@foss.st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
