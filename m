Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6C15C8E4
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 17:53:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C67E1C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 16:53:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E7B1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2020 16:53:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01DGgpl2006194; Thu, 13 Feb 2020 17:53:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8vgAJdjhQ8karyga0+/9l3jQLJe3efxEv5HmFVbHBzk=;
 b=HTCAVu5woPgqOhyfdfHvLVieMBX7K0H2a4zvsg93NQNhzCX5eVnbIHdt/VFOGWaFrWiZ
 RlXa8C2I8XPpvOHcA6wtjhCYUCLqzFabjrhwhTeCUfNfMahR5Stw9l7DP0+Ekh05I11h
 ZMyzzB8vy5pCLYoNl9ZWlVq2AUUcwbezYZ6iAcJU0YWdTwfE7nF65Q1yS6GTYDzxF00J
 CvAFNtAWBJ06B4zQJG4Dw8qs70xmfxWl1nWlnAbx0ftpndxrw1HXDEDeEGfIZyEC5bpo
 PvYtDOgpDUcegNQSnUI9S3h5YuC4TDcXTaH8f8Wvb2Z4derFPPaJGS5v9CB31iTxXfl7 XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uda6bu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 17:53:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66F2510002A;
 Thu, 13 Feb 2020 17:53:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5EF482C60AC;
 Thu, 13 Feb 2020 17:53:36 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 17:53:35 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Feb 2020 17:53:35 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v1 2/2] board: stm32: remove fdt_high and
 fdt_highinitrd_high
Thread-Index: AQHV2pu6IK/MEv1lL0eT1nA/fiAqKqgZZvJQ
Date: Thu, 13 Feb 2020 16:53:35 +0000
Message-ID: <40d2e6c2b5414a24978d130928a2511d@SFHDAG6NODE3.st.com>
References: <20200203141040.3236-1-patrice.chotard@st.com>
 <20200203141040.3236-3-patrice.chotard@st.com>
In-Reply-To: <20200203141040.3236-3-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_05:2020-02-12,
 2020-02-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] board: stm32: remove fdt_high and
 fdt_highinitrd_high
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

Hi Patrice,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: lundi 3 f=E9vrier 2020 15:11
> =

> For stm32 f4, f7 and h7 boards, remove fdt_high and initrd_high as they s=
houldn't
> be used, this allows the fdt and initrd relocation.
> This implies to set CONFIG_SYS_BOOTMAPSZ to indicate the amount of
> memory available to contain kernel, device tree and initrd for relocation.
> =

> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> =

> ---

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks,

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
