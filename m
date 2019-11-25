Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5919410928C
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 18:04:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D43FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 17:04:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3409FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 17:04:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPGr3et007611; Mon, 25 Nov 2019 18:04:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/0yJ8aKOquNgp0MryUVvydFqZzqxvXIuyF6mCx6iLbU=;
 b=IQrGWQ1BuA6wNc8t5eu9AQSf6Ag6zpzahf9paDf8ymzigr5tR6YyP7U3KuLgz//LMLNv
 IXzGzZg07omJxIxNIeLPiEI+rQhaRJHIIyYl+TMrpP7QVdkCy2PQZNK4IwgK/HsoQWAw
 txqYepzr9309wP3lYTJUYgo2JivSYUtJsr9crLsGBzYlvWQtvRGUwHbZ4+LF+rbEG9UJ
 hC1dXDDwtSPV4cQQao+4kyB3k+OdTrerBjS4+5NF26pKvVdnT33vwFi9hzDiKNk5ezGi
 GKyqgsmBkGBHZhYl4AgbUerQf2WrIy4T/HAP7zwFRGpYZ7znExU5itoDDJ/uLNZ7+1Qv Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wevhjj1g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 18:04:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B988100034;
 Mon, 25 Nov 2019 18:04:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D6852C0329;
 Mon, 25 Nov 2019 18:04:38 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 25 Nov
 2019 18:04:37 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 25 Nov 2019 18:04:37 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Patrice CHOTARD <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Suman Anna <s-anna@ti.com>
Thread-Topic: [PATCH v2 1/6] remoteproc: elf_loader: Add elf resource table
 load support
Thread-Index: AQHVjydarxMlJhR1K0quTVweh5lUI6ecRGag
Date: Mon, 25 Nov 2019 17:04:37 +0000
Message-ID: <376c883f6e134e1ab146157a3e8eecbc@SFHDAG6NODE3.st.com>
References: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
 <1572442713-26353-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1572442713-26353-2-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_04:2019-11-21,2019-11-25 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/6] remoteproc: elf_loader: Add elf
 resource table load support
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

Hi Fabien,

> From: Fabien DESSENNE <fabien.dessenne@st.com>
> Sent: mercredi 30 octobre 2019 14:38
> 
> Add rproc_elf_load_rsc_table(), which searches for a resource table in an
> elf64/elf32 image, and if found, copies it to device memory.
> Add also the elf32 and elf64 variants of this API.
> Add a test for this.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

At least for STM32MP1 platform,  I test a M4 elf firmware without resource table and it is working.

Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
