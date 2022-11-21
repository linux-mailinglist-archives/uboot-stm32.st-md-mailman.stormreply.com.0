Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F002C6322C6
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Nov 2022 13:45:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98709C65065;
	Mon, 21 Nov 2022 12:45:49 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24C8DC5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 12:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Td4kRmDqJLCzJiEYHZEqQIVld0CZiaZfUVorjokj76C6W4mPeUDqn+Sq6Fd81RHdRmm48ZHhlH+ukvm4Rrww97ElfCz0TANkNpa5ZqfGXT9wpQOpbTvjvQtO5zQLlka01tAoHNM1ae0oQaPllvt5vpJ/sFhfbaf32wjWpPntJ4VprKteUEP1mRjArFC19CbtsIVaTqTsGFnEevuo1pCYZ8iAeeagIBU9uFzbtGuTcTxRILXxs3o9dNGJQgrzf+HX10ksU/Z1esc4zZ44gPagMdNC3kPZ7Q2gS2hRNdlYXD/a/7kMLpA9/jxFiguAVn7dYwDhdvjqyyr7YH/lgD/s/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ugAlSqhOfjWf3rIJM2GMZgBVujr82/Yw1jKMx7UpIc=;
 b=dIOCGE/vb1n9d9johWag2B1sh9lXSu8daycedzls+mklj8uP/q+5ZjBXzHU63eK5hhSOL3qlfy8NMp5GGPhxs1a5hEoXk1FGnFxK2E60VRKuPG4TBQTOE/IKu0WqkSJ3Cz/LAse6Ig0TfO6bUN5waQ/DiY+OYzkwUAnL/0GgUHnPCIIzhG338PRcpBUOMZPmamvYMYDyXS/M4sM/0OepAD+qVzAKTEJUA+fWi7w2RAyCezDms7On0uzQgtj/xIS1Hu+RViEvJuXHWi7hIgw2nGRuooSapRp6xCc1fuwg2v+Plu2PN4S/uRdKPxXrAz9vSPdkG4Tj8xFrAHV5RCKbFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ugAlSqhOfjWf3rIJM2GMZgBVujr82/Yw1jKMx7UpIc=;
 b=gCWUUSoirvqMotwz3oETI1nbJtML0xrcMEIdoWmqrExNKE6N23r7OdQTqt21lHqfitQQEatMqRTeEEeWcP5bayNXUKEnaSJBUbdxs4am9GbPXiAW0DZrwtJ9tNLNyQc/QXbdnQDHcS/cT2857ARucT/ss38cZAwVna+y7YI2eFZVCfqBIWTpldsH7OfDk+4c7mpJhJKA/EDR/MvC9MOWTqV+SvarHkWVMXzIIXR2USpLj6EjmlcCJXw9iCt7uqzwU/vFzV2D27BUESSprtqPPhsS/z3sLcwRA9+ASvS0uJ7+WXNfxuznUIlPJmUJ5YA2xF/m4nw2bQCku9fFCCo+Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 12:23:16 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 12:23:16 +0000
Message-ID: <b7e891d1-d134-b489-eb2d-6125d4c7b6c6@theobroma-systems.com>
Date: Mon, 21 Nov 2022 13:23:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 30245876-eec6-44bd-0f28-08dacbbb2a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHWwi1QAi/q/+q+gBNHAx1lORE/bLLe/S1szcC2ue1YfqFWzlgvpCXId3BcrLFCNyyENfy7HQbnbfRpVeIPW6hphilFDVHBh2z2qnXsQVEu4QgZlnqZMVpMayPrW1Edm4BL3l6yGrfD1GGeyU3V5n1LGf6W7CEipWcSAFGef794M9Vn+RdbZKP/oM4YkFMxxMZRaQoIeB6fK621tqYuZsvJUOEXl3Y4vTdLquG0LEfvZ+/ivLVAmIrQuzSndiFBhI/DyNGXMp4Pba8nfMMF9GLN0KTF6WlansqfQVKmBRiyIyZM35CNwgaHR39NR6PV+B/54SiPhCAGF2wJz7Ynq85orMlx4N55TEqEdtQq45BUdq67NUUaOM1RChKDWHu3eHYPwGuyJ+Iwn3ADSxfpOBvzlhBjnwEKNdARSuSgKQuONi3jXInxdIAysHk1aap174ukpu7/z09mShDqVHSrvxr4Dn3wBWFDmzG/Vizjs7LrItwYXNe9xC1xx7YDT31rRxhfeRSJGfZElHhYnQLC47L5/SvGfFnRkrDcqlLSjBCw+qKAJutsnHLDjp8gy9JZK+bKODUZEu+pZjdlidPHtrbSyHdFLGhSqEKQ+0Us5IUl2OVuZrYojXoLF9b0kyWw3/FegGxxtran2i3cRa/MBY+axQ9/iPl/v6vke8prrF8D99hkMLnf47cqZKDp0Eq2AQdU+9eGPp5FWL31iJIRvLA/ft0j0iIcYVj8lMihBWAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(366004)(39850400004)(346002)(396003)(451199015)(36756003)(31686004)(86362001)(31696002)(5660300002)(44832011)(7416002)(26005)(2906002)(53546011)(2616005)(186003)(6512007)(38100700002)(83380400001)(66556008)(54906003)(6486002)(6506007)(8936002)(41300700001)(66476007)(66946007)(316002)(478600001)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFZnNnR3MVRHbmZyQWJuVlJxVGZwQ1VRcTJQdGlVRFZRU01kQThxWURJL3Fo?=
 =?utf-8?B?RHpBTGcyUWFtSDBpWjFTQ2NoNDJkb0thd3YrQ2cxSjFWdktqd1JkaWUzNGc5?=
 =?utf-8?B?NGE1N1NicVF2d1ZVK1U1SDVMTnhmY29LMzRPMUZtZTVPa0NwZE1lMDJ3bjRi?=
 =?utf-8?B?VVFrdVFiYTBXRGdPK3d1N2FtbDNFM2JaSXhjaHh6bDVnbUdTdFViZE5QaDMy?=
 =?utf-8?B?emJTbWwxRlB1MjNFVGZvYUFRQmlpSnRqRXFONld1eGw4dE40UnIyQSt6MDlP?=
 =?utf-8?B?UmZxaWtRNG5QT0gwUDdPR1V5a011eXZHMmhkWDlaazQ2NmNyMHRMRTJPT1Bj?=
 =?utf-8?B?SktqTFBLSTFFek9YU29BcHJVR2EzeWdqY3Jxa01YcXk3S0MwNno0dlVBOTdv?=
 =?utf-8?B?NUowT2hlQWN6ZnlIRXVzSWhnRG5JN2lPVzN1UmJkTGQ0UHNoTjZZTnJIWFRi?=
 =?utf-8?B?cGk4Y0s3QjRZbTAwdTh5dnplaWN3aGlsVWl0OEIwNGE2ZzVsTVQwV0NuN2Nn?=
 =?utf-8?B?eWRLQW9jTFEyblJXSlpTenlLMmVWSHpiSXdEemJuVVVkd3FUVElxSnZtaVk2?=
 =?utf-8?B?SUVHT1d4UWhyQ0NYbUl0QmhjQlRpS1VxQ0dWWFhFOVRNUFgvSHFMZ2JqNlZI?=
 =?utf-8?B?c0lRVy9oZ2YvODhEbC9XMnREWkt2VCsvMUhXcU5KWkN6UEhUamNGc2JhSDl6?=
 =?utf-8?B?elYxamxHbFpSRmNqMkN3SnU4R1NaV3lENTg0Rjg3YnZuK3prdno2SE1KNDVM?=
 =?utf-8?B?NTgrUGJNTk1KbldxcVZ6RHQxdTY1Z1YyYXJ6Z2ZKODZPcTlVYWVnc2pERG9Z?=
 =?utf-8?B?eWt4WHAzMkFoWG5GbzFvaVJnZWpHZXRSR2FJYWNSeElvMWxlekVhU29OUm1i?=
 =?utf-8?B?WmFBRUFacmpmRG1XN0EraHJyVmtHWFQxS2NQdTVUbitUbytLSENpZnBwUE1W?=
 =?utf-8?B?TDlzUEJhTXVrM1A4N2lCSzhyd29JUnhtb0FpSGVQcTRYRlExUUlmeHRyMHhr?=
 =?utf-8?B?VW1kcFVodlR0TXlFK2o3aEpOM01aQWlnTkZ6dFdjLzQraExWeXI1MVhURld0?=
 =?utf-8?B?YitSdzdjS3ZSSVhPQkN5ak1XRGRJbElEMGU4c0xQQ3ZFN3BWdjEwamp0T2N4?=
 =?utf-8?B?ZXZxQ1ZLVW8ybXRwWVlWWGxnNExJN2J0bDBXRzFDM2V0NjdUTUpMdE5jbXZC?=
 =?utf-8?B?S2hpdjI3b3NMazhZSlBzLytnZzg4VnQ0VnJCN3hXMVQ0MXhWeTl5dHVIRXRY?=
 =?utf-8?B?ZTROR2RPcDFONk1uZlZjQWRsaWc3ZmdqYWNOVkM5Y1FuTElJRXNIVUFON2cv?=
 =?utf-8?B?NXRGblVtYjVTSERvYm1sRTg1Q3NpR3ltczNNUnhSRnMxaGJmUmJZc1g2ZHZh?=
 =?utf-8?B?dm0zOENLNHA2NFRTMm9KWGxlR3BYemZqbEhxYlJLU3hEK3Q0K2RPdjIrb1Rs?=
 =?utf-8?B?bHBWWjNLK2g5a2lNWnZTcXpsNkxtN3ZqTnNPM0M0Y2ZMNktNU0R4eXBKdjB4?=
 =?utf-8?B?eU53RkQvVHpYdWRNSTJHR25QODVLU2Q1N3pCTlh4V2MxYU9hSndHODRvMWNu?=
 =?utf-8?B?N3RqZThyL2EyTDdmOTR5OFJVendTWFdrcmZ4K3NlQi95L3BIVG1hRG5VL1FZ?=
 =?utf-8?B?d2lzV1RqU3hndzVuaDlSRlg4MWZIeTQ1b0d3dmpoMHRJZXJ1NzQ3TE5VKy9o?=
 =?utf-8?B?cVZVNk8xd3kvR0xITStQZlYwRm9YbHl6MTBFeVNSZjgxRDh6VXNacnR1R0FX?=
 =?utf-8?B?WDBtVnVoSVVJb3hVT2dhTmJiRDlvU3BjYmY0WVZIOXJVMEZGZ0wvTHJJSFFZ?=
 =?utf-8?B?RFNHdkZaVHZhOVhDeUllVnBNNUVWb3h6S3E5eG1iKzdrdXFpRHI5UUlVaGV4?=
 =?utf-8?B?cW51RFVxZFk5MUpETGtVYUtlVmc3bVFxVm5FWkszMVQ5ZWlyQ251ZTF4LzM4?=
 =?utf-8?B?U1FwK1UwSERHSGEzNytMV3B5T3d2d2hTaUIzNmVBbWdYY3F2WjZER0J5TVhK?=
 =?utf-8?B?ZDh4NVJqbGdpUXVzVlE4RHNIU0tHQ21MWksyWUFoZi93ekRLSVh5cGRMU3hP?=
 =?utf-8?B?dTQvalpSTHQwVkI5QzE0OUVUT1VqM3kwc0tKV3ZyZ3h1VTZDUTdLaTBoUjNW?=
 =?utf-8?B?ZGs4YzRKVitjMmxyeFZpRXROc3FVVlllUlF3Z3J5cTQ2ZlFkRE1IdXZVYTkw?=
 =?utf-8?Q?R9QncV70VCJIjd6jufi69PM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30245876-eec6-44bd-0f28-08dacbbb2a8e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 12:23:16.1028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oe4YfHsBbomuzJs3Ch7+umW9cmvifsa9bdXZuAXc0qhv0Z9V2R2yv099QkMgIaOhRGTzjpvbvAfkDHlqhH0Gkx49842N6BznhRYsEsaKLQHPqDPntDz9RFznqGK+k07b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7753
X-Mailman-Approved-At: Mon, 21 Nov 2022 12:45:48 +0000
Cc: Edoardo Tomelleri <e.tomell@gmail.com>, Peter Hoyes <Peter.Hoyes@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick,

Thanks for looking at it.

On 10/28/22 11:01, Patrick Delaunay wrote:
> 
> Since the commit d5ba6188dfbf ("cmd: pxe_utils: Check fdtcontroladdr
> in label_boot") the FDT or the FDTDIR label is required in extlinux.conf
> and the fallback done by bootm command when only the device tree is present
> in this command parameters is no more performed when FIT is used for
> kernel.
> 
> The next file "extlinux.conf" no more selects the device tree in FIT
> but use the pxe fallback with the device tree of U-Boot.
> 
> menu title Select the boot mode
> DEFAULT test
> LABEL test
>          KERNEL /fitImage
> 
> This serie restores the possibility to use a FIT in extlinux.conf
> by using FDT label with the same string.
> 
> menu title Select the boot mode
> DEFAULT test
> LABEL test
>          KERNEL /fitImage
>          FDT /fitImage
> 
> even when a specific FIT config is used:
> 
> menu title Select the boot mode
> DEFAULT test
> LABEL test
>          KERNEL /fitImage#config
>          FDT /fitImage#config
> 
> The last commit of the series is only a minor improvement.
> 

I tested this on my Puma RK3399 and it does work again, thanks.

However, I'm not sure this is what we should go for?

My worry is the following:
What happens for old releases (pre-v2022.04) where KERNEL worked just 
fine without the FDT to load the fdt from the fitimage conf specified in 
KERNEL field? Would we now need to keep an extlinux.conf for pre-2022.04 
releases where FDT wouldn't be set and one for 2023.01 and later where 
FDT would be mentioned? That does not seem like a good thing for distros.

I unfortunately cannot answer the question myself without spending 
significant effort patching v2022.01 to get it to work on our Puma 
module. Does anyone have access to a board to quickly check an 
extlinux.conf with KERNEL and FDT set to /fitImage on a v2022.01 release?

Is there really no other way than adding this new requirement? (Nothing 
against it if it does not break older releases with the "new" 
extlinux.conf though).

Cheers,
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
