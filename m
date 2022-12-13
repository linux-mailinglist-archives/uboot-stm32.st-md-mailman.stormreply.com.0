Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8036064B7BB
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Dec 2022 15:48:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DDACC65E61;
	Tue, 13 Dec 2022 14:48:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8701CC03FC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 14:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU+QB6d07kDuIPcxaOyU75qshJB4T0Y37OWn0IsAPjrBkyKp0vRpIyITCAN57PmLAldY5puOnblJkuN6OI/MPSUmMuU6IQCRLz/xigmB7MGpcKCHMltCP3exKjqRcnRE7w1ftxDlLygeuyjaPMCW9Kd525AT8bXr+1G6Htav8kvhEzYeHh4dP/krJTPxgonzkQJQlXiik583FrznoEOsoyOBZiTORwMpRPja+5pXENcUeJiWfhtZN3SkN8IKAmLSmW6L9WoU5FcFZFWenJvRPMlhXM0zomBOYeVYP24WeEsn5g/ZBwF7avi/WXxiosE4bGlVCoUKUsdF+lm5iJUvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sybDCC46BsxdrRooWvx3yZIq3097F/d/pbqP8hOaTbI=;
 b=N5XTh8KYQ/LmnZOB10Jo5sRv2ZLCUZ8WbsedBuhoulQ3d5a66NUIHoR+yIkNS1/prU021YbV4x8MzaacKASS1W+ydasJsTgDgcPfamjvtttpkGRqRSFbYUbCA6Two7yvyIHCWFYvERkMf/bHw6Xwp3tqLj+vV3iSMPymzFrcmXlv5GxGirirADjlr7K50f0Ve/1ax8dFG4sofNL3sQ1QOC0rUhhPL8pbqti8ABN7LjhZvzUke/q62yOKFbDijaQpoxiMBTMKCziEXk67zGyRTNBbdOrtXhe4G9iumAwXxqTixcpYxKHSv06BZ2pZ6S4OE+zRFyn13DmXSMCoG+PuCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sybDCC46BsxdrRooWvx3yZIq3097F/d/pbqP8hOaTbI=;
 b=R9My1ELoB8OfM9CkDhH2koruRZixQTKhlSvlNJif37WIaYZ6gQ7Cc8plGR6uOiJ6Lw/CtfB7H7HJZGVu+dl2YMONLDRivnm1jJ9oFN/zXc3oj183gZ0lta0uIZUho6Esfo83c0t0obI1BKler8QYimEmuHHXcd1Q09jcWybwaPSCjz01ZLwxxb4y2CZzUUA35F9VjqRmh9xF6IFs2P8dGtws3zB+MlUCbErLjz2Jn3mud9CmEGoauaaxw3XgHhb5/MRPTXpfdRI8Up0odFYZuYiM3SK+AXGEJyQG8qnFyaORdQBYU4Rb1XuETZ8yWEOo1ic7xWmoGiuS2P5T/PZBQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB7729.eurprd04.prod.outlook.com (2603:10a6:20b:24c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 13 Dec
 2022 14:48:44 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%7]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 14:48:44 +0000
Message-ID: <90a47202-6f6b-e8e7-521c-9df6a5730a5b@theobroma-systems.com>
Date: Tue, 13 Dec 2022 15:48:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: neil.armstrong@linaro.org, Patrick DELAUNAY
 <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <b7e891d1-d134-b489-eb2d-6125d4c7b6c6@theobroma-systems.com>
 <5f67e057-c41a-d4a0-b199-5840ae771e35@linaro.org>
 <f0dd213c-4a34-926d-3f3b-f2ed49bb92c3@linaro.org>
 <5ce0e4ad-b015-3487-614c-a60099dbede9@foss.st.com>
 <9f0641d9-b5f6-ed05-1563-ae96ca873052@linaro.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <9f0641d9-b5f6-ed05-1563-ae96ca873052@linaro.org>
X-ClientProxiedBy: VI1PR0601CA0005.eurprd06.prod.outlook.com
 (2603:10a6:800:1e::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a9bf2d-18a1-417b-da3e-08dadd192257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZr9Rj006hjrZvMmxNEriYBI//WVINVgsKThcEaXwmluzqztGmsCKS38b6vr9w6Z0NJbvocKIFdY8BMkdlXyt/5h65nvpeLI6vcEuezZ9oPFR/pUEvLTIlr3IoKz7Zb7m/52hq0iE6QwSWqlTwtEUTX0P8jkWmKeZjH8+OR5UOkWMDGEITt0piqzZGA27pkE2QXZj4S7pzpwJi6/D4oImTAT1pYI3LYylOXln7cPi+4odHJUqwvWThf8AlX1lPXHGDI2yv1PJfAbhsVD7kx9Xa1Z012/w1lTOJEuuO45erUVxtC3wDzMBU7k6WrQQq/8fiWUJillMF8drh4G0gES5myDiL1QudTp5TJaWV/fVrdmZChORNke+IvvmWaFYHNR727JZ4FQOgEQHQk0pWr90YRhkxbMBIAzp7lvh74IrrIwzotdpDXIBtyu1tbwrM8Ly8wuKayw7W3IbKHaBWdmJ72a86FqflZgRb1Nt8nkB35AOs41kW1cZYPN2exoWcL6wicow3j7z5466b+t2GgCAQW8O8OVtjuBiXRuR0WVwYIwJu2lL7H/BE/MrJiI5x6S3+f6aOYO5V40vU/HClElgZpga5sbpOfXdrUZROETuReNfIFxmLVEHW5T2e0lYnoXLH+wwVdpCJFzBE3WdXk5Rbi7TaxRvx5WPRnRNuG7CNk35SdyzEyIOXo4AGioMTmK1RHKQKaJgvj7BUvzzFcHRv7yQDHVR7QTtmVsh0pASuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(451199015)(38100700002)(7416002)(6486002)(31696002)(5660300002)(86362001)(44832011)(478600001)(66946007)(2906002)(41300700001)(6666004)(66556008)(4326008)(8676002)(316002)(83380400001)(186003)(6512007)(6506007)(8936002)(2616005)(66476007)(53546011)(31686004)(54906003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVNDa2tPQ3BxdnhzWHVDT1FYOWx6OWp6R1Q4Ym1CY0JTbVBsdlFYeDR4RURr?=
 =?utf-8?B?dnN2YzE0SkRpWHRJZTJHenBaUmg0WGpqcVBvMDRSa2ZFczVBK2J1U1dKSktv?=
 =?utf-8?B?aTMrUm5SWWJncndPTklHc2MrZFB0TW1MMkMvNlBlUVlBcGpGSjZNa0xQc3gr?=
 =?utf-8?B?OWF1RU1HeWczbnkwc3poc2xidzZLTHovaTZGNHF4NTY2alN2UmdWUHp5OWFL?=
 =?utf-8?B?ay9zbC9obHRZYTEvb0cyaXVGc1BUTklCSy9PTkx3MWt0UThaM1hUWVhDZ0xG?=
 =?utf-8?B?dkhLYURDNlBDQ2RrY0JZZzM1S3JqaktKN0M1OVA1SHl2TTZpR0NKdzUreGZk?=
 =?utf-8?B?VDJXOFlXTm9rV0lwcHNoendxNHlBMVhjc0RoOGNYdjk5dExXaXNpRE5aV0Fs?=
 =?utf-8?B?UFllSWJVWk45bWtFSVFWUDdqaGF4VUx0QVVGNlZza0xsaitETDcwZk45ZDZM?=
 =?utf-8?B?ZTRTcmxzc3ZPVk9BYUxUOFFwWW1WdlA4UTlSMi93dENVRW1GbHg1cTJEWHg3?=
 =?utf-8?B?RXdzU1JuWkg5RXYzc1NqaGNqWlcxdklRS3c5Z3JMSW5WUnI5Sk5Db2tOak50?=
 =?utf-8?B?dFJvL1RUQ2dXcGQyb1dFb0JSWnJoMHRTVmhjOHQvNlB5bmRyZDh6MzRUVVQ0?=
 =?utf-8?B?WDdjVlZrdVBnM1ZWSU9RRnpLN2dQdzhHR0owUU9FeEtSSnNjM2hqUXNGdmx2?=
 =?utf-8?B?ZWhoc2FjbnF6REhlWHBaZzJCV2FHcFdTZzRaY0dYNCs3ZThQdDBhbjFEUWZW?=
 =?utf-8?B?eHJ3Sm5oMlUyR0hHM3kyeEZicm94Q1oxY0FtdXUzYTI0MnE3R2hRdjBFMEJn?=
 =?utf-8?B?WUV4L1ljcW5MWlFndVJTUXhsdnI3WUQyZytVQnlZU0hSMWIvVFpzVmVYNlox?=
 =?utf-8?B?dU9ESHRyTWxEOVljZUs3K2E1YklwaGxreEdiZC9OS0dBeDlsWVZlTU1mT3gw?=
 =?utf-8?B?eEQ3TE9pMFlLN1lnR1BXTEZ2cTE2TDNCcVZJNmRucWR5V2pUMXU4TGhtazQv?=
 =?utf-8?B?Y0dseU9yVHNLOXdJRkdpQUNwM0ZBOHliU25tbG9tZ0haUnk0QzMvdS9ZTllM?=
 =?utf-8?B?RTNuWFBtSDFKdlJJdDhlUXRwMmVObm5vYzJrckpyRTh6SXNVblhkbHVhV3Fa?=
 =?utf-8?B?RUtSU243VVJxd0h4RXlnSEIyaEJ1a3VtUHlKRDBEaWZSSXFPS29oOUZJNits?=
 =?utf-8?B?c0t4Ry9WN011RlVLQVdkT1ZMSU85NGJFUk41OVk0eDQxcytBUldDMkk1dW1m?=
 =?utf-8?B?c2thRDdYUy9JdkVhRnVQZDJaT2xuWnYwMVEyNzJqaHZacnZ4b1J2a1JaMk9W?=
 =?utf-8?B?cXVnUlZlUEYxUkMwSlEzYWNDR1UzZmxCNE9DVmF1MnIxdGJla1pqcXZONlZk?=
 =?utf-8?B?VVVuTUhrOWZQOENPdXlwREZkSFl5dFZsSm91M2Z1d0ZaUWdnaTFPa05EVjlr?=
 =?utf-8?B?QlRWVi90SE5xVmpXR1JHb1BuVng4MGNPWENDU0RON1NONnF6TUpwWWJJTVli?=
 =?utf-8?B?bW9IdzFPQ0tKOEpkQzcrc3dVVnNaQVY1Uko0dnFGWHZWaEVMQlo5K0t5NTg3?=
 =?utf-8?B?MVNlM3FSd0VhWDgxUkUyRGwwMUcveGd4cU5TQzhFNGlOS1ErZzl4U1ZoOGhl?=
 =?utf-8?B?OFBUazVSSjdKWnpEeEx0a0FYMk00YTl4WkF4VTI2ZGpwSkFPdVdCRVV6RjZr?=
 =?utf-8?B?dlhqM0U5QWVQQW51ZUJGQlNIWWgrWVZ6bWsreWZiLytaRUVHS0paTk12eits?=
 =?utf-8?B?YWRHTHZaUGZjeUNFSmNiL0Y4TnkrK1pwZG1yREdFTkZxRGFLNnhLWFpWaXVv?=
 =?utf-8?B?aEpxS1JZL3Zyc1hkdDRmbUZGTnNCU0prdDdvdEdjTkhHVTZZTWIzQS9EbjEy?=
 =?utf-8?B?WTN6KzhWcXZ1R20xM2pBSXN6ci9kSVdkbFBPSXVxaFRLRG5SWURSa0hYWDlB?=
 =?utf-8?B?UmIvejFvTmoxNXZZRnlmTlVyMnBCeEVvcHF4WXVaNjlIaDJTa2lNbDBJRTF1?=
 =?utf-8?B?OWs4TjZMeVcyOGN2Y1Iwa0U4Q3R3ZmVFcVlVQnBqZW1NcjBDUCtoQmtFbFVM?=
 =?utf-8?B?QzF5Tm15UFV6Zk45bEphSlMvL3lCQ2FXcmRlMzU5UnpVbEdXK1pyTFduRElO?=
 =?utf-8?B?Sjlrbm1ZWllaRkdPZXQrbmNEY0dPcmFia3R0UDloVFc2MGhpdTQyalRNVXFm?=
 =?utf-8?B?NGdrNmNQVGxrcDR2NTBtc3JBN2hjclVqZFVVQmkxQUdsUkZBUDhENGU0MW9n?=
 =?utf-8?B?dzN6bFkyWXdwa1dhQjRKTHl4Mjl3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a9bf2d-18a1-417b-da3e-08dadd192257
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 14:48:44.7387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TflQ15G0y0l7JFrOl36R1i4yVdwld/avLeYKRmXIgLlOw3X6/QWqAdeP2TaUacniiImD5EKVLiBIk8rFyhr9PvHIM7Kh8mAIAuegdSoAHUx9egp/SP+WIrFEJsbvCiFd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7729
Cc: Edoardo Tomelleri <e.tomell@gmail.com>, Peter Hoyes <Peter.Hoyes@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Zhang Ning <zhangn1985@qq.com>, Zhaofeng Li <hello@zhaofeng.li>,
 Ramon Fried <rfried.dev@gmail.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 0/3] cmd: pxe: support INITRD and FDT
	selection with FIT
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUGF0cmljaywKCk9uIDEyLzEzLzIyIDE1OjM0LCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3Jn
IHdyb3RlOgo+IE9uIDEzLzEyLzIwMjIgMTU6MzEsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+
IEhpLAo+Pgo+PiBPbiAxMS8yMi8yMiAyMDo0MywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+PiBP
biAyMi8xMS8yMDIyIDIwOjExLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+
Pj4+IE9uIDIxLzExLzIwMjIgMTM6MjMsIFF1ZW50aW4gU2NodWx6IHdyb3RlOgo+Pj4+PiBIaSBQ
YXRyaWNrLAo+Pj4+Pgo+Pj4+PiBUaGFua3MgZm9yIGxvb2tpbmcgYXQgaXQuCj4+Pj4+Cj4+Pj4+
IE9uIDEwLzI4LzIyIDExOjAxLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+
IFNpbmNlIHRoZSBjb21taXQgZDViYTYxODhkZmJmICgiY21kOiBweGVfdXRpbHM6IENoZWNrIGZk
dGNvbnRyb2xhZGRyCj4+Pj4+PiBpbiBsYWJlbF9ib290IikgdGhlIEZEVCBvciB0aGUgRkRURElS
IGxhYmVsIGlzIHJlcXVpcmVkIGluIAo+Pj4+Pj4gZXh0bGludXguY29uZgo+Pj4+Pj4gYW5kIHRo
ZSBmYWxsYmFjayBkb25lIGJ5IGJvb3RtIGNvbW1hbmQgd2hlbiBvbmx5IHRoZSBkZXZpY2UgdHJl
ZSAKPj4+Pj4+IGlzIHByZXNlbnQKPj4+Pj4+IGluIHRoaXMgY29tbWFuZCBwYXJhbWV0ZXJzIGlz
IG5vIG1vcmUgcGVyZm9ybWVkIHdoZW4gRklUIGlzIHVzZWQgZm9yCj4+Pj4+PiBrZXJuZWwuCj4+
Pj4+Pgo+Pj4+Pj4gVGhlIG5leHQgZmlsZSAiZXh0bGludXguY29uZiIgbm8gbW9yZSBzZWxlY3Rz
IHRoZSBkZXZpY2UgdHJlZSBpbiBGSVQKPj4+Pj4+IGJ1dCB1c2UgdGhlIHB4ZSBmYWxsYmFjayB3
aXRoIHRoZSBkZXZpY2UgdHJlZSBvZiBVLUJvb3QuCj4+Pj4+Pgo+Pj4+Pj4gbWVudSB0aXRsZSBT
ZWxlY3QgdGhlIGJvb3QgbW9kZQo+Pj4+Pj4gREVGQVVMVCB0ZXN0Cj4+Pj4+PiBMQUJFTCB0ZXN0
Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIEtFUk5FTCAvZml0SW1hZ2UKPj4+Pj4+Cj4+Pj4+PiBU
aGlzIHNlcmllIHJlc3RvcmVzIHRoZSBwb3NzaWJpbGl0eSB0byB1c2UgYSBGSVQgaW4gZXh0bGlu
dXguY29uZgo+Pj4+Pj4gYnkgdXNpbmcgRkRUIGxhYmVsIHdpdGggdGhlIHNhbWUgc3RyaW5nLgo+
Pj4+Pj4KPj4+Pj4+IG1lbnUgdGl0bGUgU2VsZWN0IHRoZSBib290IG1vZGUKPj4+Pj4+IERFRkFV
TFQgdGVzdAo+Pj4+Pj4gTEFCRUwgdGVzdAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBLRVJORUwg
L2ZpdEltYWdlCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIEZEVCAvZml0SW1hZ2UKPj4+Pj4+Cj4+
Pj4+PiBldmVuIHdoZW4gYSBzcGVjaWZpYyBGSVQgY29uZmlnIGlzIHVzZWQ6Cj4+Pj4+Pgo+Pj4+
Pj4gbWVudSB0aXRsZSBTZWxlY3QgdGhlIGJvb3QgbW9kZQo+Pj4+Pj4gREVGQVVMVCB0ZXN0Cj4+
Pj4+PiBMQUJFTCB0ZXN0Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIEtFUk5FTCAvZml0SW1hZ2Uj
Y29uZmlnCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIEZEVCAvZml0SW1hZ2UjY29uZmlnCj4+Pj4+
Pgo+Pj4+Pj4gVGhlIGxhc3QgY29tbWl0IG9mIHRoZSBzZXJpZXMgaXMgb25seSBhIG1pbm9yIGlt
cHJvdmVtZW50Lgo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gSSB0ZXN0ZWQgdGhpcyBvbiBteSBQdW1hIFJL
MzM5OSBhbmQgaXQgZG9lcyB3b3JrIGFnYWluLCB0aGFua3MuCj4+Pj4+Cj4+Pj4+IEhvd2V2ZXIs
IEknbSBub3Qgc3VyZSB0aGlzIGlzIHdoYXQgd2Ugc2hvdWxkIGdvIGZvcj8KPj4+Pj4KPj4+Pj4g
TXkgd29ycnkgaXMgdGhlIGZvbGxvd2luZzoKPj4+Pj4gV2hhdCBoYXBwZW5zIGZvciBvbGQgcmVs
ZWFzZXMgKHByZS12MjAyMi4wNCkgd2hlcmUgS0VSTkVMIHdvcmtlZCAKPj4+Pj4ganVzdCBmaW5l
IHdpdGhvdXQgdGhlIEZEVCB0byBsb2FkIHRoZSBmZHQgZnJvbSB0aGUgZml0aW1hZ2UgY29uZiAK
Pj4+Pj4gc3BlY2lmaWVkIGluIEtFUk5FTCBmaWVsZD8gV291bGQgd2Ugbm93IG5lZWQgdG8ga2Vl
cCBhbiAKPj4+Pj4gZXh0bGludXguY29uZiBmb3IgcHJlLTIwMjIuMDQgcmVsZWFzZXMgd2hlcmUg
RkRUIHdvdWxkbid0IGJlIHNldCAKPj4+Pj4gYW5kIG9uZSBmb3IgMjAyMy4wMSBhbmQgbGF0ZXIg
d2hlcmUgRkRUIHdvdWxkIGJlIG1lbnRpb25lZD8gVGhhdCAKPj4+Pj4gZG9lcyBub3Qgc2VlbSBs
aWtlIGEgZ29vZCB0aGluZyBmb3IgZGlzdHJvcy4KPj4+Pj4KPj4+Pj4gSSB1bmZvcnR1bmF0ZWx5
IGNhbm5vdCBhbnN3ZXIgdGhlIHF1ZXN0aW9uIG15c2VsZiB3aXRob3V0IHNwZW5kaW5nIAo+Pj4+
PiBzaWduaWZpY2FudCBlZmZvcnQgcGF0Y2hpbmcgdjIwMjIuMDEgdG8gZ2V0IGl0IHRvIHdvcmsg
b24gb3VyIFB1bWEgCj4+Pj4+IG1vZHVsZS4gRG9lcyBhbnlvbmUgaGF2ZSBhY2Nlc3MgdG8gYSBi
b2FyZCB0byBxdWlja2x5IGNoZWNrIGFuIAo+Pj4+PiBleHRsaW51eC5jb25mIHdpdGggS0VSTkVM
IGFuZCBGRFQgc2V0IHRvIC9maXRJbWFnZSBvbiBhIHYyMDIyLjAxIAo+Pj4+PiByZWxlYXNlPwo+
Pj4+Cj4+Pj4gSSdtIGJ1aWxkaW5nIGtpcmtzdG9uZSBpbWFnZXMgd2l0aCBtZXRhLW1lc29uIGhh
dmluZyB2MjAyMi4wMSwgSSdsbCAKPj4+PiB0ZXN0IHdpdGggRkRUIHNldCB0byAvZml0SW1hZ2Ug
dG8gc2VlIGlmIGl0IGJyZWFrcy4KPj4+Cj4+PiBJdCBicmVha3M6Cj4+PiBGb3VuZCAvZXh0bGlu
dXgvZXh0bGludXguY29uZgo+Pj4gUmV0cmlldmluZyBmaWxlOiAvZXh0bGludXgvZXh0bGludXgu
Y29uZgo+Pj4gMTrCoMKgwqAgWW9jdG8KPj4+IFJldHJpZXZpbmcgZmlsZTogL2ZpdEltYWdlCj4+
PiBhcHBlbmQ6IHJvb3Q9UEFSVFVVSUQ9M2ViYzAwMDUtMDIgcm9vdHdhaXQgY29uc29sZT10dHlB
TUwwLDExNTIwMAo+Pj4gUmV0cmlldmluZyBmaWxlOiAvZml0SW1hZ2UKPj4+IEJhZCBMaW51eCBB
Uk02NCBJbWFnZSBtYWdpYyEKPj4+IFNDUklQVCBGQUlMRUQ6IGNvbnRpbnVpbmcuLi4KPj4+Cj4+
Cj4+IENhbiB5b3Ugc2hhcmUgdGhlIGV4dGxpbnV4IGZpbGUgdXNlZCBmb3IgeW91ciB0ZXN0ID9k
byB5b3UgaGF2ZSBteSAKPj4gcGF0Y2ggPwo+IAo+IEl0IHdhcyBleHBsaWNpdGx5IHdpdGhvdXQg
eW91ciBwYXRjaCBhcyBRdWVudGluIGFza2VkLCBoZSBob3BlZCBhZGRpbmdoCj4gIkZEVCAvZml0
SW1hZ2UiIHdvdWxkIG5vdCBicmVhayB1LWJvb3QgcHJlIGQ1YmE2MTg4ZGZiZiwgYnV0IG5vLgo+
IAoKWW91ciBpbXBsZW1lbnRhdGlvbiByZXF1aXJlcyBjaGFuZ2VzIGluIGV4dGxpbnV4LmNvbmYg
KHdoaWNoIGNvdWxkIGJlIApmaW5lLCBJJ20gbm90IGFyZ3VpbmcgYWJvdXQgdGhpcyBzcGVjaWZp
Y2FsbHkpLiBJIGhvd2V2ZXIgdGhpbmsgd2UgbmVlZCAKdGhvc2UgcmVxdWlyZWQgY2hhbmdlcyB0
byBiZSBiYWNrd2FyZCBjb21wYXRpYmxlIHdpdGggb2xkZXIgVS1Cb290LgoKVGhpcyBtZWFucywg
YSBuZXcgZXh0bGludXguY29uZiB0aGF0IHdvcmtzIG9uIG5ld2VyIFUtQm9vdCBzaG91bGQgYWxz
byAKd29yayBvbiBvbGRlciBVLUJvb3Qgd2l0aG91dCB5b3VyIHBhdGNoLgoKT3RoZXJ3aXNlLCB3
ZSB3b3VsZCBoYXZlIHRoZSBmb2xsb3dpbmc6CgpVLUJvb3QgXCBleHRsaW51eC5jb25mIHx8IG9s
ZCB8IG5ldwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0Kb2xkICAgICAgICAg
ICAgICAgICAgICB8fCBPSyAgfCBOT0sKbmV3ICAgICAgICAgICAgICAgICAgICB8fCBOT0sgfCBP
SwoKV2hhdCBJIGFtIGhvcGluZyBmb3IgaXM6ClUtQm9vdCBcIGV4dGxpbnV4LmNvbmYgfHwgb2xk
IHwgbmV3Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpvbGQgICAgICAgICAg
ICAgICAgICAgIHx8IE9LICB8IE9LCm5ldyAgICAgICAgICAgICAgICAgICAgfHwgTk9LIHwgT0sK
Cm9yIGV2ZW4gZml4IHRoZSBzdXBwb3J0IGZvciBuZXcgVS1Cb290IHdpdGggb2xkIGV4dGxpbnV4
LmNvbmYgKGJ1dCB0aGF0IApzZWVtcyBub3QgcG9zc2libGUgYmVjYXVzZSBob3cgZDViYTYxODhk
ZmJmICgiY21kOiBweGVfdXRpbHM6IENoZWNrIApmZHRjb250cm9sYWRkciBpbiBsYWJlbF9ib290
Iikgd29ya3M/KS4KClRoaXMgd291bGQgZ2l2ZSBhbiBlYXN5IG1pZ3JhdGlvbiBwYXRoIHRvIGFu
eSBjcmVhdG9yIG9mIHRoaXMgCmV4dGxpbnV4LmNvbmYgZmlsZSBieSBqdXN0IG1pZ3JhdGluZyB0
byB0aGUgbmV3IGZvcm1hdCB3aGlsZSBub3QgCnJlcXVpcmluZyBpdCB0byBjYXJlIGFib3V0IHRo
ZSB2ZXJzaW9uIG9mIFUtQm9vdCBiZWluZyB1c2VkLgoKQ2hlZXJzLApRdWVudGluCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
