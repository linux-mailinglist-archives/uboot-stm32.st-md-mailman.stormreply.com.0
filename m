Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A715D784
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 13:37:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0703CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 12:37:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A284C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 12:37:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ECX476030417; Fri, 14 Feb 2020 13:37:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=phDRnN8eDeWsinv2B7Hq+2jJUOZgwhwKmE2gOkDMVsI=;
 b=N7DDyIsZGB2Jmk5GN3egbQL/BTIbS3mMyGMUpQSSRJzhVPQSOc/DK35U7eiVO1QkOeyt
 lsVLPIUUh4wnP+13785dqc65I8xWbE5jEcS/ihTVtccOimieuKnZcL0RsI27doI7jH0X
 NSizZ3sxlKE4eXPEqA4Wg3P+v2RPJ5l7ZgYcTQ45N1IBiM51KxsGhrYJGHdV+PshVeMG
 hTbHDX+52GGA26VVQYErQtShVVaG+qQTehqFsZUrk4Uz41VQCyyyODZkUa8FjEa1xdzR
 NlTCRIzTLZejfPAqWXEXFgvd+/+lM7ScVs2n+LA/HMg4YS/P34x4GxEa19MbYDDMHD3U MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhuvf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 13:37:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60503100034;
 Fri, 14 Feb 2020 13:36:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 589412B2070;
 Fri, 14 Feb 2020 13:36:58 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 13:36:57 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 13:36:57 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp1: remove fdt_high and initrd_high in environment
Thread-Index: AQHV4ABuMlMPfBezok6S+NyfpulBT6gapq+w
Date: Fri, 14 Feb 2020 12:36:57 +0000
Message-ID: <fd37bdbeb92645eaa08c5eaf3007618e@SFHDAG6NODE3.st.com>
References: <20200210115346.1.I82bc82f60e739674bce1015b8a7906d3852f0b93@changeid>
In-Reply-To: <20200210115346.1.I82bc82f60e739674bce1015b8a7906d3852f0b93@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_03:2020-02-12,
 2020-02-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: remove fdt_high and initrd_high
	in environment
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: lundi 10 f=E9vrier 2020 11:54
> =

> Remove fdt_high and initrd_high (set to 0xffffffff) in stm32mp1 board env=
iromnent,
> and U-Boot always relocate FDT and initrd in bootm command.
> =

> This relocation is limited by CONFIG_SYS_BOOTMAPSZ which indicates the si=
ze
> of the memory region where it is safe to place data passed to the Linux k=
ernel
> (DTB, initrd), it is
> a) Less than or equal to RAM size.
> b) not within the kernel's highmem region
> =

> So 256M seems large enough in most circumstances and users can override t=
his
> value via environment variable "bootm_mapsize"
> if needed.
> =

> This modification increases the boot time but avoid assumption on aligned
> address for bootm command.
> =

> A user can still define this variables themselves if the FDT or initrd is=
 either left in-
> place or copied to a specific location.
> =

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
