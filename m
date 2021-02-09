Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2443314B5E
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 10:22:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B0AEC57B53;
	Tue,  9 Feb 2021 09:22:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13004C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 09:22:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119978Ke023186; Tue, 9 Feb 2021 10:22:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=gw6lGCpBGLrdSohwdfzZxTZco06/r26HXUno340t1W4=;
 b=EZ76Z+AZAe1FNqxATJzgf1+M3JP5oiXXRGPMM+g80lm7J4yTWKM9o63GkW6JQTgxmZxy
 oebrZQHUCaU9eO0VHpP5gn3tLb18IWjZ6Pwt/2zf/yB41Lnw07qRg1YZM6YBlrChGKxc
 Q7YfD4avO66ia9SLVVXMZKwUBkyw3UpYS8luna78XyhAec/2mkbv7qcQ8024dc8W/dke
 Z9Z9PUbdghf0PVj6drvhMWqPPDnOMWckeSKXM4cx9YrIuFNVjZYd/ATqjExmD2MLoOaB
 DcAHLAkv5c+/zx0FOfOrzNtRZuUznagbghaJjQ9P9hZV+dBkoqjqX4lw+kYrTOUqE6jC 0w== 
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
 by mx07-00178001.pphosted.com with ESMTP id 36hr31fg7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 10:22:47 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aS5yHR9v8qbdHYoRzDaC39834nu/MZBkbTnuBpPiXU4qWBrlI/G8905Ctubnjv7YG54O4rb4yDAVO8aMqhlY0phepV77S5kgaKYqnRwx6mfFVw7J5Tw7ooTKrMIdmtypnd+M1iz+y9G+/4c3Ag9x4hGWyUzExIUPswFLji58jt+0vRLibq5gr4qsx187yAriHJWZkwtzwGdtUHxcu5iQPcqeRV3JBAdJi6aqOQfUcgaUIKklunYFfwjrrnGazkM1NcXmIWP8D1zbmPqMQCEvvaYSshnprBhCDWTJ5ike93oUGFTodwzHaeCZQGvNsmYGMxyA0c83SmOD1K1fplJP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gw6lGCpBGLrdSohwdfzZxTZco06/r26HXUno340t1W4=;
 b=W8dW8XHLY/LCev9ef4Y+kVJcddPYyyYCcZMKpc9EAAvvUcR/kuEfqd7KRbb5X2wBHiO/AbuvILMN7xtJKDu9FROL+VAujrz3WCDBbGqsx4DcRaYrA+J0rXb8hcMOsdY/MJjbVeKRpKQhidLPz44HyQLegK7myzhb6sOP9wOj26tEtTeRFBtdFl+qubb3Wq6zUfcxTkU2HYxi+9esyOGHodepcAJvhodXbZY1IksfJ9tLM8j/5LaxJSK/p2xWQOIDHdgWwUNLyjpgIh/G/Saov+YzCB29zaVdOAJ/ZpxzFJQymjeiH8nTZLtosME0kosvl6hIkOgUsU2nByZz75+tYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:332::10)
 by AS8PR10MB4696.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:319::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 09:22:46 +0000
Received: from AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc14:a66a:5af7:927c]) by AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc14:a66a:5af7:927c%3]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 09:22:46 +0000
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/4] configs: stm32mp1: enable the fastboot oem command
 format
Thread-Index: AQHWhqyUpN8fo/BOAEuQVchYfx+CIKpQfMkw
Date: Tue, 9 Feb 2021 09:22:45 +0000
Message-ID: <AS8PR10MB4760C1C6DFA520CBB452C6C9E58E9@AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
 <20200909152426.2.Ia6ff004576355889c1813b2d056d9754110d8f2e@changeid>
In-Reply-To: <20200909152426.2.Ia6ff004576355889c1813b2d056d9754110d8f2e@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.168]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af5af9c9-00fa-49e9-d06d-08d8ccdc42f0
x-ms-traffictypediagnostic: AS8PR10MB4696:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR10MB4696A3FEFEDAE21857469C15E58E9@AS8PR10MB4696.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:576;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wr8ThG9rADgPohRsNTGqhaFbiVgKdEjAp6KLE5Y7lqWz2/n7tJxbBMNNet8HGM9PVtBASATa4Dw4EHuiMi/K6MjydbWX24E7gJN2Ra78Kvk+bEPQ2j9fF/3GVyfCQRqT2jn/kQLbngAilSOxvQbB2I3fFP7AhFqrYSl7gp0F9sqOZdpMcQapboCgRUE0OHifHa/x3FUdXLiIedkR1/ApnUDKBoigpiQUMDwTLQoJHmTLeYJ38jpbPM4NZytEaDvkSIPufUpIEowZXv6CAQW+9EGIrKluR74OqHgbz3LBfgJ3Cu/GurrKVzPoZavxCbeCR4d4QKF4KwEkezZ5OaY36lZ215Q8TcelyS1jsVBYSkrMz2Bun4uQYDIUomrWVg4iOE/nsBCtQg0hGvgMA7WqZuRyMZxNypGwA74R7lgtwVUQhbvuvid2nIOf3g2k4BRs24OlyqRzFfOH5yaobuayE4EYwM2wCojaowdskzmH4J/NRzHycmvYm9clpfYDl5LAI7u7xpfz3lTPCm6ItfdViQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(478600001)(7696005)(52536014)(316002)(54906003)(4744005)(2906002)(55236004)(86362001)(9686003)(33656002)(71200400001)(55016002)(186003)(5660300002)(8936002)(26005)(66446008)(76116006)(6506007)(66556008)(66476007)(66946007)(64756008)(6916009)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?FdB1dw2xFJdUYOr9PaEfUcMcLnMtztDaMBCZdk9FVabM0sYdxXJ4tnMggtE6?=
 =?us-ascii?Q?Xc+DlpEjZQWUfiLHpXyiNEZipGVJBpfimLyQnDuFg/78Cn2hJ800MJF3Raew?=
 =?us-ascii?Q?L8tQozCk5BMIrNMyA4BkoukGChbkzJAMcrwQaPVMBzm9ftoDEk7YSteRhIJI?=
 =?us-ascii?Q?DcgqxMc61UNwJJKr3EHzgcq56tLFH+3yQ0+NZOnuSuCIw+iIGa2YDOenQ6w4?=
 =?us-ascii?Q?MvjBum8qTDkzgrrISSm9q7X3pS9ArXfLX93tMALlM+Wa3EodDWi3l4y6UE9v?=
 =?us-ascii?Q?hdjWSKcwuI1Y3skgSF3PP0s99ECbt+L0HGGjoDw+6QuiE+/nqcpkHM9hOFJY?=
 =?us-ascii?Q?b4obbroMgycEb7HFsj8hvPRtdv2UzKJN8skb89wiVhglfs9fUeem5C+EDMTI?=
 =?us-ascii?Q?54IHOKd0Pfo7GLCCPgN6TlC3+3zNDqiWZvOLlIMD2bgu21AYd+oupLPUZwN9?=
 =?us-ascii?Q?8FCtIWeUNF1aU6IdrT0QT+m5yZizLzxKPDN5DU3bchaWzDDgTa1iaKBB3TMQ?=
 =?us-ascii?Q?U831UtXj/J7X/We135BFgNP9YAUnRfY6+tT7xFFlfVcAQBmXBIoIwH5wHTVQ?=
 =?us-ascii?Q?waUc2SNw0ghLiuF7u4sj2fGHrIayUGf76BQHB9OzLZUFh0nUqH4qJY5QijBb?=
 =?us-ascii?Q?EJRpeZie+CdCBveo6BGPyX9Wf3Byzj1qU/vr8JRQgrxIq+15AnDcycUzzeqF?=
 =?us-ascii?Q?fgK42nT/7EaZZp1RDJTNRJRLOv8eeouwcmJAOBpBKWpdVrLHKMaZUWupiGx2?=
 =?us-ascii?Q?cG2BqycH1y63MdVTUSaFHpXuPKceYjcg1WYej2+9Ri4T60mQKhBoTMzAYR0A?=
 =?us-ascii?Q?/PiWOJ+64CCIn1OwJHUfMS44mtmkpZBTp7plH1PNgE+aqgOro2iggjrm/h0d?=
 =?us-ascii?Q?a3IuRZkqIJRU/p5nfJmefNlKQdy1TpukV7hjORFjOb0xCOTw8vBerIQVSfhb?=
 =?us-ascii?Q?9+OtCZMMdRUYMKRlh7pVOHzjZVuQHs0U3j78kWkFyNBPiUfy9xsTTj7ye5KP?=
 =?us-ascii?Q?dVpRLkgoIYBkTFoNmFEZhhOt5vCjXJN8/GiPW5mNEy2O1BoJB+OQrRTiR15b?=
 =?us-ascii?Q?Uq6jmBdwca38AbVS+kHXvMwcHw1vdcRc0en8TSjxI36wFvGgh6AVWeigPFUX?=
 =?us-ascii?Q?PEWHycfv6vU2GmYAfvqQECsgBdu/AClJps48ZiH5rt0HjFXMet1bVr4e+Vlw?=
 =?us-ascii?Q?nz66kDVryDWZqAM67BKc+BggMTv6ZW3Tte4NMrmbOKvX861q50yiKMsfrIRh?=
 =?us-ascii?Q?aqT/NyX77EiqyzA/tMIVZv7kPcECHqCbehaw1tIrqmHFra41Yc8kMFpuhsj3?=
 =?us-ascii?Q?QQXlWKg5EuN86Iwjx3UsXN9b?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: af5af9c9-00fa-49e9-d06d-08d8ccdc42f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 09:22:46.0187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9fKcJsal0gMq6SU49f3BDLgOs58eI+/o/BGRguhRCvhdILp26ilO6GzVNVwhXMXuf8DvAprpSujTUCT86XLNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4696
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 mlxlogscore=775 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090045
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-philippe ROMAIN <jean-philippe.romain@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] configs: stm32mp1: enable the
 fastboot oem command format
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
> Enable the fastboot oem command format and set the variable "partitions" with
> default eMMC partitions list.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Jean-Philippe ROMAIN <jean-philippe.romain@st.com>
> ---
> 
>  configs/stm32mp15_basic_defconfig   |  1 +
>  configs/stm32mp15_trusted_defconfig |  1 +
>  include/configs/stm32mp1.h          | 14 ++++++++++++++
>  3 files changed, 16 insertions(+)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
