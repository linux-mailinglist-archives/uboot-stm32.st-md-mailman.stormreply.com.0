Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A51314B57
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 10:22:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35463C57B53;
	Tue,  9 Feb 2021 09:22:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 580C8C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 09:22:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11997AA3023190; Tue, 9 Feb 2021 10:22:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jUF64omdgOTC0in/jF4IZxKG3zCMIznGBIRXKkOLShc=;
 b=qG1382UDPrH//95PLOPmUO1hW8vEegIYVldoDMs9Y3osoTxiRjEz/q3NOlUObBES1OGr
 3kmRzkSE5gCo3n1Mx64jj6VF2nJKtWZLYSioBaNfAK8VPgqcdN9gqffICQ1LyFFPq7jb
 zX+norRyw465QIY7UTjdI2v0AKsH9CgYd6mun6HMcBcHQUUPYz5YuYby9epzpPotuylO
 +79HCqT+uXzE76pPY0WaFEjkjeEtMa0K9VhlXnRRoh4YqsIhASp+rImFyv4Ek9rtV3FQ
 ZyI+IG4vY7UkhTkvig8aIglINX/fu69FQCb4hfLbcuVQe8Pc6BGAVuTo/MP6SfaImM5s Qw== 
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51])
 by mx07-00178001.pphosted.com with ESMTP id 36hr31fg4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 10:22:20 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zf2w+lxihkmFDExmldqgSBurFaD4L/fU9AHwSq7EqapUz0C5mZ2Nm4g9vCSw4ePfoSY5lEYGPR50V4pYorRoZssq7RgzUpJIuHTjBjC5UW8Pr3MNuAOPs92fZvPjCoj7GoTKdthSHMH/Horq1L/RrK82va2V+z0vD0Nd7IcpEPqNM/vPX03M1N/q4zhsA+KBAJSH2hMbi0f9E3NIp3bsW+g4X2X4rP7GhTsLOGYTvPiThvM322jfg54uOX8SWKhtzCupeEB7xzfofvNm88XG3BEPaTNaGzRls0AjWSOozphqTf6+uvULFP13KaZRof2ZPGSK4E5HVUDXUxgpYlTE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUF64omdgOTC0in/jF4IZxKG3zCMIznGBIRXKkOLShc=;
 b=GhLlMK7MXdgvBZPmYq9pFG3qNTm2xgGaEp4Lr64AGtEVgu/LuLQzUuC8ikYtTuDZFhJBc5CqNzlV3wkDtSZRi7KMS8IVZXuoBzWDntZVsMjGexmYAs2gyHWpb6gFgfr7v/Wpq2VrBpw942F/eM0vmBtwd03tZFFP+v3C8kligwDvHf1CevsG3FjRoqb23pGtIjRTrVbS042pb7e6JggCiJ/5Thx+IUdAAVZ0j52bTAuIIsTl7JW3vhH/ULF7FiBY7xjWvIDMBTYpvvb4UUk1xCz5U9UCLoX5mWBRgs6Yv6TFJuLCFwRdeayP8zY8B1npOm8OHZArK6afYSH425PETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:332::10)
 by AS8PR10MB4696.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:319::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 09:22:19 +0000
Received: from AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc14:a66a:5af7:927c]) by AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc14:a66a:5af7:927c%3]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 09:22:19 +0000
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/4] configs: stm32mp1: enable fastboot support of eMMC
 boot partition
Thread-Index: AQHWhqyU6Q0m96XtmES14J7ABemgbapQfKMg
Date: Tue, 9 Feb 2021 09:22:19 +0000
Message-ID: <AS8PR10MB4760F95F775F0C48288F76C4E58E9@AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
In-Reply-To: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.168]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48aa6569-eeb8-44e4-a5d5-08d8ccdc3339
x-ms-traffictypediagnostic: AS8PR10MB4696:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR10MB46960E97BD80348F0ECF2C13E58E9@AS8PR10MB4696.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:361;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V09aHEICrFhfXFp+yw3rqspbbCLVqSWyI6HD/Lefo65XehsMGGRL7kuvpb/RvrfynQsiAbsbUMHV2GTG+7KAqO4EUX402Wrer/g5x08ihhnyMbaPOBrhncSFueBHFdQPXX102H6U5HWCspPDRjVBCaIH8a4H0AWq3Ho67tse/L91FiDHJcsWEtw1ECf2vDM1S82ZUdlrSiWMQZKium4eo/YhdMFuWl0Zd/gkRCNu11KmLkFCuB3ZDhB6arL4eAe0PkGiE6r2hMt2Io5r/TFfZj9ddyFZmbqNZQZIxRsRbfnpO7E4Xa58o0C+4yASxvu1mTugghrwRvbHDAtym4yrwtLdHB5n3jT9w7h4Z69cBI4B6cePYIjT8B7BoqxnGyo4S0zUYRFn7yIAapBryuvZOgmNIBOgTl2TySzr2kRTquOz9O+vNlh5UoygOts8brSqgNZew4Ohhu4LBuHCLMhXxDRD1jW6F8gWuHv440MRb7HfxaK1QAFPNSsWRgsAmKi/Ss7GJ1o4u6IfujoS7u2Ngw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(478600001)(7696005)(52536014)(316002)(54906003)(4744005)(2906002)(55236004)(86362001)(9686003)(33656002)(71200400001)(55016002)(83380400001)(186003)(5660300002)(8936002)(26005)(66446008)(76116006)(6506007)(66556008)(66476007)(66946007)(64756008)(6916009)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JlKu6ETLFmxu+yxYbGweZYve21Ve5xtjMNxRRYlFGDI2bkHUvxprwIBEYa92?=
 =?us-ascii?Q?IIgOKzmvxvLvZDUT4L8hc+rtJQbCzlaXeKSsbyX9x5emE0/9xNXN38PRWYZN?=
 =?us-ascii?Q?gk4qAWWS5nGPSXCMhV3oktHgR0dt9vmLGsBug6M1LwOlb0Xjn5E+yemuzuau?=
 =?us-ascii?Q?lKk14oD5xrhvW8v+ppEua/IcStrpM6Dfj5WB4zN6dGiLvijCoQjBzDYuTQ20?=
 =?us-ascii?Q?j8cNqWZiszHKbptc+6ajSZ6bQfLoiX2eof4MQ3gsOJzzv2cZku0KkaqjJq+t?=
 =?us-ascii?Q?niRpyIiO0ZfV8eOVSYI5mBBEWejphyI2XqNwhp7ATQ+jlpfzWejuojfwK3Yy?=
 =?us-ascii?Q?sfkb0f/WvHvBGMi+wW4sYJCwyHyKycZrkq7sE0wFZPyJH/ogPdMYW4X/TnUA?=
 =?us-ascii?Q?ysCFOaD0XXIoCAyXQ1TNeLuZQ+xeNNnVvKozHtqt3M6t0N6IbEECF3hZ0pUD?=
 =?us-ascii?Q?c6O0YPIwoDD2SRoMNUPzcBWIjzRYjuTbtSWbN7jcG+o3g94ydHg8IzbISptg?=
 =?us-ascii?Q?7UyJ+hfq0Ea6vRT/oOugiLMqENAYptH5qrNi4VDsdqRP6T/H9X4sKmOCiNyQ?=
 =?us-ascii?Q?e6MTsnFymwH60ry2uKzYTLCnpFS0PtFwahv6ZIflO9Y+p7Pkt0sniimo5tpJ?=
 =?us-ascii?Q?VBEzNMOJF+BqsQFpoFf6sOJF9yP2hzYImjYRHidf9izsL0GUGbzDml90nhNQ?=
 =?us-ascii?Q?kUDDC1IFFtQAn/raUxd52ZafYE+fT6y+qqHkgZyXB9CXqMM0TsuLCGIg3hhH?=
 =?us-ascii?Q?gODOpwdtOzzYJM1KnVcVuJnDGmB6YasXJc1UqakoH9CWlhhSRlwJgF2Fhls0?=
 =?us-ascii?Q?bsb+hTku2hlDCBkPBRpmVV4rkQ8f7OYB+DkjuIj3D7uTLOqH4P9h8mqUniqL?=
 =?us-ascii?Q?rRFzXo1LjhbWMdl9dh4zGrdJkf9JRu/49x/mofswm89YQxUMpt36283kSjqK?=
 =?us-ascii?Q?lE1kr06Udbzs1dmJQ7958ye+HEinfCUKo02DF+6xwV+BmgM/b52Mgh7yr2s3?=
 =?us-ascii?Q?S5zQEyI5wq49lFdo2wWI944Av4IOa56saJEnXXBpLf/AJ00otkrgbVn+3iCu?=
 =?us-ascii?Q?hmvLlnZpvFveHADSIGuN7YYZ9WbolaoArnCPF5YKZcuXJVOnRnhOs2aD34aP?=
 =?us-ascii?Q?mpnSNgaHTlXmkJbvyRHAhQbZhYM6irdLVzGtfN4EVnAzdXKzsFWI0/iPRGtj?=
 =?us-ascii?Q?V0/WaAKyiXCzV8gLIsEYQpnoHOl1Awh8KEHgtXUzYV+zuZWvggix88huwplF?=
 =?us-ascii?Q?BuIgIk1KbAuCKQiMe/XEEAG5isagC6kwrpES8TUn0wW43xDFdtJF0+LHsYU6?=
 =?us-ascii?Q?iSKQ99hz71QDFa3sNLelFMEf?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 48aa6569-eeb8-44e4-a5d5-08d8ccdc3339
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 09:22:19.6197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jVPaYa9f0mO4cSIhcyXI9UuphnztdMgHHRwk8VNXrcim27y4JVuUhBbG7JFrSFQs/tD5+6Y7EZvLOPPd+S4Thw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4696
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 mlxlogscore=832 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090045
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-philippe ROMAIN <jean-philippe.romain@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] configs: stm32mp1: enable fastboot
 support of eMMC boot partition
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
> From: Jean-Philippe ROMAIN <jean-philippe.romain@st.com>
> 
> Activate fastboot support on boot partition for eMMC, mmc1 device on
> STMicroelectronics board (EV1).
> 
> Signed-off-by: Jean-Philippe ROMAIN <jean-philippe.romain@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  configs/stm32mp15_basic_defconfig   | 5 +++++
>  configs/stm32mp15_trusted_defconfig | 5 +++++
>  2 files changed, 10 insertions(+)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
