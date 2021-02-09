Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E6314B6D
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 10:23:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A79B0C57B53;
	Tue,  9 Feb 2021 09:23:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E24DC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 09:23:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11997AC5023193; Tue, 9 Feb 2021 10:23:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=z/L7yy4OKQXrU+M4AAM/RESht7oIQGd0xXFo4RgB4h0=;
 b=qUMO4f5AhtFFM/uHrmamqNL4FmlcQNnGj2DVoiTBs8u0uGeXx2d7uRTF/c3i0oihpA1k
 5KlBqy6Kbcvm//SgugbbHBfYGm1Av7CD+7TnBIoeAIYapD1Xbw8R74fuzlCt9wULepcF
 8czZ6zeL9CvHIpmVt+ekybcSLbGhH4uuZh3bC32hq9XL6CeaFlHa+mN2/bfa8iC9bIQQ
 vu7vgm6aefUcGT+nGkCy6THB4FMpLdvpbVn7ix9pX9rLfQ5mY1CMaVOnEjhoW69JvWMr
 fD3zyDR5HtpnCTlT0mtK/UTbe4+cdO5tYhRiAD1QaqunpDkiLS/yKlnBXM3MbCJylunG dQ== 
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
 by mx07-00178001.pphosted.com with ESMTP id 36hr31fga8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 10:23:18 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPEuPByeOhQ57ZThupztin79GV+/TB5JExXullshJI81/Z3cr2YCp+6XnyUIKiKPK7cOsBiJ/1xUuRmFCVLFAzAkictXwZYAL1EqIul+gkmcsgzn9kQbw/0bMZ0lefyhG4lWGRhcKWX4GYsZeWL22fnMQerNj1ZtBRKERJQ/wLAvhv5L23HId/EPvTHHkb5/eDJMEp5SewtkScfaGM6nhuaHW73ydKdZRs61kzRtSdAQ7c5iDJth8n3HXdrdQDysJs7nx1ghO5G3uATTbDZL5po2lKr1hpL+KwefQKBnmfV/EBaLDYR48HNYzPCKIlK/zXhLCJPhdFvJ7EwfbJFztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/L7yy4OKQXrU+M4AAM/RESht7oIQGd0xXFo4RgB4h0=;
 b=XPpILFCA3SPoI+WskfYm5hpeZPamUBj1A8aCI6g7GO8ztBAJspFoXHIg2wIMNdKq6fd3MPWIe7t0AO+VRJshIgqfeKd2cTLxPU59f5t1OwicSIyOtS9Am4jRJgfpbE3+ysA6n/XeWdKfd3uZ/StGCLRTrtBRdF5luoNAuuRCKOLim5lm7pM2H7to3HEyRDiqRDA/hmOePd3K8pgsKzs1zIhYrP1cNANAnB0Rtd+QHbSFFnwxyro74g+pkUuZylxK7KbKL9B/w4K/nj/3nk6RHZjMzrusMnBX6ff0/6UfCQlH2g3S7GFeegoFuA3Jbl9UcYa+jhyxxqrp85UCE/WxmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:332::10)
 by AS8PR10MB4696.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:319::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 09:23:12 +0000
Received: from AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc14:a66a:5af7:927c]) by AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc14:a66a:5af7:927c%3]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 09:23:11 +0000
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/4] configs: stm32mp1: enable the fastboot oem command
 partconf
Thread-Index: AQHWhqyVG2vtn5eKt0qlz4JVv7aGvKpQfOsA
Date: Tue, 9 Feb 2021 09:23:11 +0000
Message-ID: <AS8PR10MB4760315460A7886CF6982211E58E9@AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
 <20200909152426.3.Ifc72cc530e2479312583fe81352d9f58b63388fe@changeid>
In-Reply-To: <20200909152426.3.Ifc72cc530e2479312583fe81352d9f58b63388fe@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.168]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 852a732e-6303-41c5-5935-08d8ccdc520b
x-ms-traffictypediagnostic: AS8PR10MB4696:
x-microsoft-antispam-prvs: <AS8PR10MB46966EDE8878C48D7AFAC1CDE58E9@AS8PR10MB4696.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iPa5hSK/1SB7LhiBPqICAh14R0QJxJQkXUJCVFTCRVam15J4rsDJGPhn9F8X9zj3yAy3BiznXKXDvd4vr4l655vHJtO9ZZQzTQDzOD55EBnni9nLJjdtZyZsE2dz13/8CohUTnykhzA9OZs567qvh/ROYjv1Sp8He8tw8E40lcZz1rzxYaaYpKetZz2BiA+epEiDec/gM0Yqk+hC+lyjpHSZKTuyKSjIH68OfuRXvSIBacdj5T+qr20H8xm/f/QUTTwdSEIaRUi5bOjbUqNCcnVESG4TEd3WymC7FYElz7zwedfImHJtwLBODlIfP5vu0URoHHXlT352amVj2OIDGpE8jE7sieYQZ9RXWyf7Ww6jgU6hm33TpU6DJDCVUrR8h9kfdr6ip7W1E4arp8tGaFwXPN38uk0wejFaYlTwdNYTCggratIdEXOzExgvKLZrbvn7eARHRywCreG/1xwlit9GWVm1oHDrxhkOsiGDF7RZZgyLK9l9Ndn740+RhQASUmvOdtIkfKx7OTBdJvTpjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(478600001)(7696005)(52536014)(316002)(4744005)(2906002)(55236004)(86362001)(9686003)(33656002)(71200400001)(55016002)(186003)(5660300002)(8936002)(26005)(66446008)(76116006)(6506007)(66556008)(66476007)(66946007)(64756008)(6916009)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WsgU7MdPfNM1rga/gvoZO2tlaF2zh2Tet7EXRP7W4N+0OTvi5bfQfaLVA3wX?=
 =?us-ascii?Q?+ShBVwtIvYhD3U1d4g/IlXzAL/PDGdQQQ2K0ohILcBhjWzQAS+rIJzctkDCr?=
 =?us-ascii?Q?MNy0QqjpJOz9UeZfBbYoFvvv7IY4+bjKNdUNjvz+L42GzaMepPV+3LIsuDD1?=
 =?us-ascii?Q?w31SSxeTUEDPNO9PJy4LuhFZ2RCWv0ehGQK/Vw9A4fJ2e2npUUtOPv/L2ujZ?=
 =?us-ascii?Q?fRP0JOTz5Wi4X9YL+9iOI2IOzU4b6qVcKEqOlesmqhBz4Y35XJI11oSUZ9Hu?=
 =?us-ascii?Q?6Ob7YVkbRmJIiPJdXdA5VXMIZyqJqcLdE28EsBDxGjVMrwzHc91BD41noNLR?=
 =?us-ascii?Q?FUdomY216MWux0QUwROdLKr01S32JCpIzZUzCqhZGgiM4e1wf30s2yFyTtlq?=
 =?us-ascii?Q?UUZBdb9hoDyDBBVcFNaALD+MLWijnYcOegWrgtjoIkYTi8hTy6fHw3na9fbm?=
 =?us-ascii?Q?R41BjJUcnO96ANnhgz5S1I80VTKzyjPclw+yrNDS2DbKwG4lRwcN/cC92zDu?=
 =?us-ascii?Q?S94+fTLRGvy3Az4riKC3s7W0t+JHjumbu4+l7hgRB++5HmYhIPS2lw0265K8?=
 =?us-ascii?Q?5Vorzimp8io3n15z0JtNsi8EQ/ZhYSs3rFIpSuSReI72K58PwJ5A6VlybtzK?=
 =?us-ascii?Q?SGV0tU0A8l0K6gjAKh08/PSx3S11NxXpt2flhNLBGIAYlPEh9zMle0Fv0via?=
 =?us-ascii?Q?L2643fU0QalVbGnKTN2kjxU+Z4i2x8K/WpVlexGC3+sZuVr+ptkrccD6jnQJ?=
 =?us-ascii?Q?Lrinftd70IEcAD+YygYfpaj9BZ8aQJQ+iH/B70BLe9yoZzvqE/A/8sMxYl4A?=
 =?us-ascii?Q?arAT0KUlau/uWDo/sGZw3YPc8ZDviPc6rGuT14sncDEjt1z0DX3YdZLeSiOs?=
 =?us-ascii?Q?lUfs8WgvIJMBqAnLHFtFKcuJ0x5OxpQFqVkOM7KXU6lvnroXrI8bMkrzn1IV?=
 =?us-ascii?Q?Q2ENQxDxxOn4B18g/fT8Eweg/nE3Pfnq5ck5O/Bs7BN0lcgQ2K5HrXxEOlum?=
 =?us-ascii?Q?iUzBxxRWemSFcD3jMP/JzZLDr1RYur6We9waq9qVTRdmS+aSG0Jwv6GxZ2cp?=
 =?us-ascii?Q?PwjWUPM+uj8xRxNL0oR5AIUugyuMoT8836T1arO1oPcBGs3F9CQM2pwBWPT1?=
 =?us-ascii?Q?CiOh0s8p201oOyh95srxElCUbpVF6YRf8vYmtGD6jSBX2iMZx+Teeqejjoer?=
 =?us-ascii?Q?sA8HMoIncSM7aQWechnz/a4U3qdU6cBo/nSpDKkIyIr6seqxqpH7Gnuo7kbn?=
 =?us-ascii?Q?7xyrS0Ge8QugPe19faRogiRsJuDT++563iKXR+9T7ABKJRJE07PIweSjzsGf?=
 =?us-ascii?Q?e4+s8kjuOR+7AJVWsI/Hza3T?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 852a732e-6303-41c5-5935-08d8ccdc520b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 09:23:11.3804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5c0dIRdwy8/DrJTXyl6wrwFYl5PP9YVKFHSLVF/GSfk+MZdoCPS3siwe9IaBU6jbJXlNa5CjA9sLSCB3LQpFFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4696
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 mlxlogscore=741 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090045
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] configs: stm32mp1: enable the
 fastboot oem command partconf
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
> Sent: mercredi 9 septembre 2020 15:25
> 
> Enable the fastboot oem command partconf, used to select the correct eMMC boot
> partition, with same format than 'mmc partconf'
> with parameter: boot_ack boot_partition
> On stm32mp1 family:
> - boot_ack = 1 (Boot Acknowledge is needed by ROM code)
> - boot_partition = 1 or 2 (Boot partition 1 / 2 enabled for boot)
> 
> So on EV1 board the expected commands to select boot partition 1 or 2 $>
> fastboot oem partconf:1 1 $> fastboot oem partconf:1 2
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  2 files changed, 2 insertions(+)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
