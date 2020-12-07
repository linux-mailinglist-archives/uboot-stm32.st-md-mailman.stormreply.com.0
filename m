Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B05F2D30FD
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Dec 2020 18:27:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DBA0C3FADB;
	Tue,  8 Dec 2020 17:27:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13950C3FAD8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Dec 2020 15:24:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B7FDdkb028006; Mon, 7 Dec 2020 16:24:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=auJOCYkXpM6fPKBIXeNuxRkCYj5oYBvjOM2SkqchhRc=;
 b=srhFq8LeIceBHOkZv1mUA1CXz9mTvMAeK4J8D3y/gWsHSv8ZUbofG9WKZ7SVXATBN4ob
 6lmwZKISnft7IenyldYFIdpYYmRPCxEolUqX9PZt/K0yi6iZwyPKq1bU0D7E3MLgToIt
 PCppGkHhOjfc075e9Vme9uElBbgkhIqoICBJwF8+2EQ8RQZoAq4vpnfvpFXNvL0KJ0Rg
 nkCbbecTeNn7x7060LOLbrGXm7jYdcjvGhjrBH2v8uvDdnpLM6KIC2tfZ46OY6Oi6SNh
 LpLOHtxyao+LrThl7fXidhpDaLMBTXzfBkTqKnDgwvTpCLJQnlwpOBbpdWWtZpcg8gjq kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3583h3jv40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 16:24:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E03D100436;
 Mon,  7 Dec 2020 16:07:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 105E62BA2B8;
 Mon,  7 Dec 2020 16:07:27 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Dec
 2020 16:07:26 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Mon, 7 Dec 2020 16:07:26 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD - foss <patrice.chotard@foss.st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 3/3] .mailmap: map Patrick Delaunay and my email
 address
Thread-Index: AQHWyNM6fopDzsxKD0CVj63dHno+s6nrw2WA
Date: Mon, 7 Dec 2020 15:07:26 +0000
Message-ID: <e5028baf7c494c5db63957924043893a@SFHDAG2NODE3.st.com>
References: <20201202174731.9503-1-patrice.chotard@foss.st.com>
 <20201202174731.9503-3-patrice.chotard@foss.st.com>
In-Reply-To: <20201202174731.9503-3-patrice.chotard@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_11:2020-12-04,
 2020-12-07 signatures=0
X-Mailman-Approved-At: Tue, 08 Dec 2020 17:27:52 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] .mailmap: map Patrick Delaunay and
 my email address
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

> From: Patrice CHOTARD - foss <patrice.chotard@foss.st.com>
> Sent: mercredi 2 d=E9cembre 2020 18:48
> To: u-boot@lists.denx.de
> =

> Add our new email address dedicated for upstream activities.
> =

> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> =

> ---
> =

> Changes in v2:
>   - Add .mailmap update
> =

>  .mailmap | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/.mailmap b/.mailmap
> index 8250015453..33001f1e01 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -31,6 +31,8 @@ Jagan Teki <jagannadh.teki@gmail.com>  Jagan Teki
> <jagannadha.sutradharudu-teki@xilinx.com>
>  Igor Opaniuk <igor.opaniuk@gmail.com> <igor.opaniuk@linaro.org>  Markus
> Klotzbuecher <mk@denx.de>
> +Patrice Chotard <patrice.chotard@foss.st.com> <patrice.chotard@st.com>
> +Patrick Delaunay <patrick.delaunay@foss.st.com>
> +<patrick.delaunay@st.com>
>  Paul Burton <paul.burton@mips.com> <paul.burton@imgtec.com>  Prabhakar
> Kushwaha <prabhakar@freescale.com>  Rajeshwari Shinde
> <rajeshwari.s@samsung.com>
> --
> 2.17.1

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
