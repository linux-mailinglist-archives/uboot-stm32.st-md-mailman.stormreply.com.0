Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D57721FAC29
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 11:18:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3BABC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 09:18:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76FA7C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 09:18:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G9ICth013784; Tue, 16 Jun 2020 11:18:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Mi/SGhyg3YN6lwPc5DWUlvSDbYbLgsPWrvRAt7hZNvA=;
 b=f+gqXALse0LcBamTVSuCsWUAttSyeMYbA61F7FYdD5phGIwGqwiAwV+BjrN5u82KqV+9
 pHBTk81vE3/GtnHy8VtyKlxmqYgPmCm+qd6BlZu0X7xtdYeb/vamWVHnQ2L0HHetPif7
 2STaG1nDZwGGdcqKOKDhZgvgiCzSazRAteuZnpjHCxYOAxzRxWntWWbtB4w+Tku7rDHM
 iD/WnP/mCeynIPbhqoqf1JkSgpaNcq80a2LOIl9BN5LcfetSVGcwNnIkT84yiHoUASFq
 kXgGcsdm1j0B962TcoarJoo5xS4+INBGxfr14P4PgRtysa+iklnPO0mCtAhFRKwBnLku Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph66fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 11:18:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3304310002A;
 Tue, 16 Jun 2020 11:18:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20AA82B569D;
 Tue, 16 Jun 2020 11:18:34 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 16 Jun
 2020 11:18:33 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 16 Jun 2020 11:18:33 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] dts: ARM: stm32mp15: add OP-TEE node in u-boot DTSI
Thread-Index: AQHWOwpfiFdCr9zhzEqR+AOC8r0MdqjbCAGw
Date: Tue, 16 Jun 2020 09:18:33 +0000
Message-ID: <da35b253235c4d60a04d017502e7e069@SFHDAG6NODE3.st.com>
References: <20200605092427.1.I393865d4202eca31c111da33b792596f130b73d2@changeid>
 <20200605092427.2.I0b49a502a439eb6530b486f5e3ab4923195bff8e@changeid>
In-Reply-To: <20200605092427.2.I0b49a502a439eb6530b486f5e3ab4923195bff8e@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_03:2020-06-15,
 2020-06-16 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Tom Rini <trini@konsulko.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 2/2] dts: ARM: stm32mp15: add OP-TEE node
	in u-boot DTSI
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

Hi, 

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 5 juin 2020 09:25
> 
> From: Etienne Carriere <etienne.carriere@linaro.org>
> 
> Add OP-TEE firmware node in stm32mp15 U-Boot DTSI. This node is needed
> since commit [1] that changed U-Boot/stm32mp15 to detect OP-TEE availability
> by probing the resource instead of relying on U-Boot configuration. The software
> sequence implemented by [1] is fine but U-Boot DTS/DTSI files were not updated
> accordingly since, hence OP-TEE presence is never detected by U-Boot,
> preventing Linux kernel from using OP-TEE resources.
> 
> For consistency and to synchronize stm32mp15 DTSI files (excluding U-Boot
> specific DTSI files) with the Linux kernel ones, this change also moves the OP-
> TEE reserved memory nodes from board generic DTSI files to U-Boot specific
> board DTSI files.
> 
> Link: [1] commit 43df0a159df6 ("stm32mp1: dynamically detect op-tee presence")
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 15 +++++++++++++++
> arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 14 ++++++++++++++
>  arch/arm/dts/stm32mp157c-ed1.dts         |  5 -----
>  arch/arm/dts/stm32mp15xx-dkx.dtsi        |  5 -----
>  4 files changed, 29 insertions(+), 10 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
