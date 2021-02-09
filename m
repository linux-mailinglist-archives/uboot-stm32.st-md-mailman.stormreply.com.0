Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7314314B6E
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 10:23:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4B5DC57B54;
	Tue,  9 Feb 2021 09:23:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C227DC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 09:23:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11996O0j015518; Tue, 9 Feb 2021 10:23:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=F06IuU4kFVUQUso5XVULAEqkKCM911ceEYd3UCHt9mo=;
 b=hyWUCgmfQ63vxKHcv10koXfLz5a746+uRESe5iNQ5ZssCtK98QFBWX4bPY4R4A0MbAyl
 NfB5Y0EF6w7cq4L+iZktLBOjXneJLGOR1SuKAXDFuGab26Izre14F7896jegWlZ3Hnc6
 FOfNQxZkWz7WkiO1Z9k06JssogTZSr+06E4qHOvP02b3YOZlCDO24L43UyYnQyVMcBmY
 MQth/bdB5Kl1nu70Hgbl2Bx2Ugzq5iy20ZMgRMIhOq3aorqN0v74GUAvgWLGOmpAqmbD
 p9CvSC0TZC/4iGjKJQ4v8vohf/+JjyI5BMj+PixF5NyBl9d2sHKwwzP8TzN/QLn31M7O iQ== 
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50])
 by mx07-00178001.pphosted.com with ESMTP id 36hrauqkn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 10:23:36 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/OtmmUpuW02BEAUiTN+r6gdjK70A/NwH/E0J6WIJ5COzS9RrBogR7fNE/Lz3xe3ojQ8MokSj8Hp8SH594mooZapEkdqqNzXMPsCbK3osmoEImp3suI8D+HfXL5zA6wHkr1YjR2qxBA544AdxGqQulufol82zFA+DQs9Devmhr8PjiRIaYSLcEuz1UanGWP3nckHujOLcP+w4EflflbJogyR9JmaYMUx61N704I4UYafQm6wYgvPBA66uJYvS1OAUGKo4FKClxghJOSpWKT0JjXnoaiPf5ggBda3RMKmc4jWzlxACXW9//aSrn+0mdhpu/stUuUSSNOasWNLxUpHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F06IuU4kFVUQUso5XVULAEqkKCM911ceEYd3UCHt9mo=;
 b=PuKvEjFxkS6VEJdspbCkX63OsehPmeTy3fKUpGbM2TEhIQyXSMV7anbGjD8dpqHeGs/tm8TjOmaOgJx+qAM766SCHmhZ8g5DIYMS4InAcq8W95HXPJj/PkdE3/I2S7uNkT614JqqBtGyEWe1wTCvv2TK2sShVemdKGsQqXkpdRQqlBJ40gHZLuqYkpeW+wURROJSxrQM9LxFgzOMZldVRvjLNjiRtK2pTHHTm1snMjWludz0FwQjcHHGumccFxzCqurjJPU2SqwqkYIo+7vZvXvHg8r9l13NW+puUKCVb6jQjb3NyucGIe3bDKd1lEXZtrR20S5jF7T1teYCOzuK7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:332::10)
 by AS8PR10MB4696.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:319::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 09:23:35 +0000
Received: from AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc14:a66a:5af7:927c]) by AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc14:a66a:5af7:927c%3]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 09:23:35 +0000
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 4/4] configs: stm32mp1: enable the fastboot oem command
 bootbus
Thread-Index: AQHWhqyVuD/635C330CzN0Ywcf200apQfQiQ
Date: Tue, 9 Feb 2021 09:23:35 +0000
Message-ID: <AS8PR10MB4760C57C4CBD28B5AC491EE0E58E9@AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
 <20200909152426.4.I3df1738f393278eeb2df2ad4fd8543360d3a5597@changeid>
In-Reply-To: <20200909152426.4.I3df1738f393278eeb2df2ad4fd8543360d3a5597@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.168]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d854d0f-24a9-45ef-358b-08d8ccdc606e
x-ms-traffictypediagnostic: AS8PR10MB4696:
x-microsoft-antispam-prvs: <AS8PR10MB46969529B963530481DCFDFAE58E9@AS8PR10MB4696.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:605;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +0kyHlTwjjlTozVyLXkYpXM5Th98tpMkSv9A6fPDByxPi4z4QfKzdY6ELwsEEZIbp0lrWMo7BSwMyDN0/wLj6GAlxyeg44wsxLno6noN4zuxX+6fpM1ERTzSl1a+5ndirrRpaQ8SwH+ceZAHL6IhNo83TTT3EvyJTX1h8R+yQzsB/74zxtgdlbknuQWw3NYNmu5E47mUabD611NoIieTzIEThGw9IJifxdneJFcqgLGPv2FsJroqfmtTs9QIoV7+fVv2OrqAHdCBD5vpsPhjU/mo6KEvRU9g5ASiVcUsNDKU4CTGSMijGYFy99TT01rwerF/YBFrc9huAf6Hs05i7j61f3bbGQVXw1ez7l1IQWQXZGXOIYwXkUPRb3a79bQ753EpcF3sumCkYlRnu9xSLrCA6U4YHD+g5LjbsvpEE6b6JkqFydeuJ12SLCWVZvJ+RG1SGeSj8v1ThPQIkKEjwE5Iqnga1vviWIHCSnKrKIfa0PTJcbG2PYbW8+rbJg47AAG+/+EonC4k3nfBGTSzJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(8936002)(5660300002)(55016002)(186003)(4326008)(8676002)(64756008)(6916009)(6506007)(66556008)(26005)(66446008)(76116006)(66946007)(66476007)(55236004)(2906002)(4744005)(86362001)(478600001)(316002)(7696005)(52536014)(71200400001)(9686003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LZ/fmLHyPZFRcPel2aemMAgNpgkx2u+MerM8IB7fL/xoSJ6dssv9ZdyOwiOd?=
 =?us-ascii?Q?1CGNqLI0hJ4kqB8IP4OOzudfl2ed5eyOSd/gnTeLLDF4SHseyoiR9jXejvY6?=
 =?us-ascii?Q?ytjDwu+XQ8R3eNI5u9BrdJhrWr5nVopTfDXrlrUiNl6P4Y1vxByrEzkexFSk?=
 =?us-ascii?Q?daeB71d8ALQIPlss5GzgH9WuP1SEvdrXfRX49SA35E1DOOTlYlI8sPe7P0fd?=
 =?us-ascii?Q?jZ/3wbbZ1csQnqkjOA+7gqHIEBu6Vl1CO1RQ/bBE0d+hXPn/AGgi2668mrWi?=
 =?us-ascii?Q?JAOB4P7I2kIVHJfQgSwgT0bq+bvb53FBXpWwJL1UhEZC7QQ+gnPuebutoSn3?=
 =?us-ascii?Q?pnQ2N1JOGvxtxA16EddJ4XScV2fdtmdNMIzIYpHXHWlW/pxzOQPSBHe5XUCZ?=
 =?us-ascii?Q?nS93LjyZhS69EznOqZrV6wm3uE5yuRVS0b5VyWjF1tj78a8oE6ocwXh+My0g?=
 =?us-ascii?Q?1vFjklwZWctT9wFRqPerraeseWbQXlamwR6S5+mKGNaK9ogzlPUgWdUBrKBq?=
 =?us-ascii?Q?DfhnVI1sV5EQw5A/EOyeVpppJd8qf3h5dpKsp1pi0Vkg/HJYIB8HuGCuPEO4?=
 =?us-ascii?Q?1bFKf8uaPWenOLABiNibvUasYTFswffmX+PVYnNdrPKXdjp77Zl71APJ0lbX?=
 =?us-ascii?Q?kaeCrkq8kZTCZt9GW5erxontIt4tCWcdvLYWRqxgWtrO7NQh7Ww0RtAgJmNq?=
 =?us-ascii?Q?qWY+T20YJUMoeSL4BWTvIrA/sFZjHcrwVpzTZUPWd0jRWkDlZGhso9ZLuysm?=
 =?us-ascii?Q?SZNCuqJwk0gURXBOZzlID/sL4LS6i9OgrzkgCIbglD6/qa97ebe3/ngT+LYu?=
 =?us-ascii?Q?/wc9Cox0HeFaPtVNwrSbiLbEP7hFkyueqwfw2AbqoU5N87u7ccS0erA3Jt18?=
 =?us-ascii?Q?Zg1rMuuMamlAmIhmdl0uli6CAPEXfDRPw6EmLwrF1pwKOv937LimVBEF56HX?=
 =?us-ascii?Q?CKOodTB6ApaU5UwZR9TsTO4+owu7dufPUlTzrqK0AE25tsAHQZNqA64asGfj?=
 =?us-ascii?Q?j4O350L6HQj1FR8czWMn6DQ/hrr9TNCaf8ip8/B3TvYwch+4CQQoqXE/AZC1?=
 =?us-ascii?Q?KyUPKL7aAwZNkFjIL80ByPn6JqTUb3zQe1Mwh4rP3b5Q/Ph1zdexTEMqYJEy?=
 =?us-ascii?Q?cKPvm4LkeFHfRC1K3eKn+yvlXqJt2eOA2eUxVnWkAxi7WKDSf6YRV3CO20Ce?=
 =?us-ascii?Q?2zyb9BpaAhF7ATbdoh5mhLSeqIBs4yAe9XRA2F82ah5u51O6wmHiqA8loE76?=
 =?us-ascii?Q?r3LRb4zi+tGuT7AVkJ33nxrmHwC7N10OwTwEDy8NtXtPuRbbPOcrFgJrvQmw?=
 =?us-ascii?Q?r+PfiZLk5FIh61qjAMN4KShy?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4760.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d854d0f-24a9-45ef-358b-08d8ccdc606e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 09:23:35.4875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LdVBd+PwgjFrwcy/W3vi7e4r1AVPrGKA/YF7pdQ3jbiZrFtccy0fJpFdodTEBeZpRo2iOn32zd9az00SPaQ9Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4696
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=724
 malwarescore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090045
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] configs: stm32mp1: enable the
 fastboot oem command bootbus
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
> Enable the fastboot oem command bootbus, used to configure the eMMC boot
> behavior, with same format than 'mmc bootbus'
> and with parameter: boot_bus_width reset_boot_bus_width boot_mode
> 
> On stm32mp1 boards the expected command is $> fastboot oem partconf:0 0 0
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
