Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 163CA450912
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 16:58:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C99DFC5EC57;
	Mon, 15 Nov 2021 15:58:10 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A511C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1636991279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsq6uCyhltyCszUdJoWjxR1/FKo7K9Eh2BRdR7006Lo=;
 b=YDRa1t4wYu7jHCHAlfdq9d0iQ5Y6VCkXKI7UyavrSVHINpItKxIpmO2UYjmBc8wAzFQbg3
 S8L7PA8zyULtqAuA7XAREDVeVDLrQfxaF5EtnyXTwA6cQdMZ3LlY0LXk1WlthdxJPcoE/O
 s0OVjMKwe6q44WhGeZQRp8ZZCKW98+0=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-uyGwn9XcNaWiq-iKPXytkg-1; Mon, 15 Nov 2021 16:47:58 +0100
X-MC-Unique: uyGwn9XcNaWiq-iKPXytkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cW70h4jWtJ/pXjagobDNuc4OT/DvX419JSbdop69Ng45uYat9/6p3TZRrJPeR7j19nyF5qp+ks1sAUSPOvhcwpounia/CMVOiswrLnxf7p16VRF/x7L97GdPAWeShFPUUGnaXEivdMHhCF6ZzBoEES9+q8tuJaWxEEan/Eg5Vqece+9dQGipjmvdnUw4EQKYLO3im4pdJvHzJtRFpjb4bKPK3ebqejMrqPwADOn83dwMHwd5wrFDyRX+BV2q2b6SBMXRm9+tkfaDiJ1TFp6WE3YCtbBqXc1nJSmg3pO83ZY3yPTYTdSc7ArGNz6J6qxXHkzY92fZlgU1fYz2ZrIeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsq6uCyhltyCszUdJoWjxR1/FKo7K9Eh2BRdR7006Lo=;
 b=ENKjMFybRUduuxbWdXReGn9eXB1mCdeCmFJg7oPyaqEeE0UD+5/XJ6C+1SZnYRqRFwaW5vAkyH2RR1ZBYWg639CoyN7KIZzgfuLSD1tPx6rMySy7AVu9tjYowDklPZOAbQv5Or/vnwGyv28uysGMyhBWEhjGZ7lXPxsbBNzyJokzKmKHzdrRTdU8cUbTh2VHq4otUGbuU1bIFQdWi1uUZs+sTZwU4bIur0ZfrKbxSxAdmneVw0TiaqvAOboIQmruV2rbn5gWYgUSLjRltPOgKNco4tXfnABdnAQoVSDqhVap/j9xxs3iCxEoeLDakmvEAOxaXXzt/xOhzAJ8L567Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com (2603:10a6:20b:9d::19)
 by AM6PR04MB5813.eurprd04.prod.outlook.com (2603:10a6:20b:ab::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Mon, 15 Nov
 2021 15:47:57 +0000
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::b81e:116f:90fa:1b9c]) by AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::b81e:116f:90fa:1b9c%3]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 15:47:56 +0000
Message-ID: <1e7e0770-69a2-2d65-afb5-4a62431282f8@suse.com>
Date: Mon, 15 Nov 2021 16:47:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
 <20211115163155.3.I4feae35bc7d3eda703b157680caff3979d01d048@changeid>
From: Matthias Brugger <mbrugger@suse.com>
In-Reply-To: <20211115163155.3.I4feae35bc7d3eda703b157680caff3979d01d048@changeid>
X-ClientProxiedBy: AS9PR05CA0042.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::12) To AM6PR04MB5366.eurprd04.prod.outlook.com
 (2603:10a6:20b:9d::19)
MIME-Version: 1.0
Received: from [192.168.0.18] (188.86.219.160) by
 AS9PR05CA0042.eurprd05.prod.outlook.com (2603:10a6:20b:489::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Mon, 15 Nov 2021 15:47:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e60a2d67-746f-4879-2221-08d9a84f4b2f
X-MS-TrafficTypeDiagnostic: AM6PR04MB5813:
X-Microsoft-Antispam-PRVS: <AM6PR04MB5813803E4FAFF5A205232B60BA989@AM6PR04MB5813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ntWB5yMXImkzxzuSpiLF0t56Dg9ZlfzyMmuDqLx+5eSotqsvmyyYmT0tGkTDNdM8W2olc9oHCFmp4Bl7dIYfDin24bXAcDb3wErsznhdDIkS5UuOadSzPCWJNer9zv7PUAMK7JyEPr0zqzMgxiRQcq56oPDCGL7fTgQx9dZti2TA04DO25wPBOxEQIYMfkTOCq5cjDgYYH8guzX7m4LklSH15TH4ocaG0HQcAPYNwG5Un843GPbcftP364diwPk4yegPi/6ymcqqGUHpscOJjlmIcHjZxxHp3xq5asm91LZ1fgwoKB6j1etdkwE1nHVew8QOjA/CRWow83pJ1l+2fDXePT946jr5ORJseMpYdhA8dsoVsdc2BeGNbqcewGbF0IlEsNpixY8++HeCVQ3URVJZc47LRezdly7LLCibu97Vtnfs5QJFOakXbn2wUSSPUvkSYoHVIZGpBw1ycfJ+CE5vhS1UujhnZ0/m6PT0tXFpngl8pnvUP0WpjYauZmyHa6h/3qtMhMY38gDycPE1K80ZWkrvmZqzj4/POGCnF2Yirr2YVI7cxpXxgXF+Cw9EPYaN/OmC89aaorL6DVJFT/aIpsMEU2g5wWfGt6u8NA+ZIMr9H5sHL+o44JXw6kt5k2Y+3TC52nY+wMIOEX0SRpu2HgJGLIXe9HXL9acPY7EWMsJ4FINUnOO+A3UNtUb7MeOM6a7GrWQzc0gn2JeV/7EbQf88WT5D1XlQIhjkaGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(38100700002)(55236004)(66556008)(8936002)(6486002)(53546011)(4326008)(8676002)(36756003)(2906002)(66476007)(66946007)(54906003)(83380400001)(2616005)(86362001)(31696002)(16576012)(316002)(956004)(5660300002)(31686004)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajZzZE4xcUhZOXE3d25obnRiQTluaEl6UkdsalBYNEpUWDZNRTNxdy8rMHEz?=
 =?utf-8?B?MU1LRHdPZjV2aDZWRWQvSjNZbzB0VVYzckJJeGs3TVNKeFozRTQzekZXY3h2?=
 =?utf-8?B?ZlBYTUVuakRkMllBZm14QmlHY0RlaU4vcTFNTndlK1V1T1VZNWZqM0NUNVp2?=
 =?utf-8?B?TGtrTnRiT0l4N0xGWHJaYUU0ZGFXZEcyV1k3RVNGZUNRR09pbkJiSXFsUjlW?=
 =?utf-8?B?MThKUWxjZEs2UlBhTllvaS9zcHlRbHBPNGhUc0ZWTzRZckd5VXVuWDJhZmc5?=
 =?utf-8?B?RUp2VHQrakRvemVkNytuZHI4RzlFNHIzUWFPUW9PbVo2NzMrelB6OVJST0JI?=
 =?utf-8?B?WVkwcmNqaWRzZm91LzlqOVNZK1RyT1U2Q09aN2FleHMyNGc5dXU3ZFBqYlpS?=
 =?utf-8?B?YXBqSXV3RERCWnd3MXFRd3JoNzl4c0lvRkx6N3FRMkZwL3ZlTWhjOVdiRjFP?=
 =?utf-8?B?Sjh3NmtHTnhMaFJUbXFEdGV3RU4xUGJza3lxcFpMOHZmRThyVDk5Qmo5WllT?=
 =?utf-8?B?OSsybit6d1B1RndpeU5aZGFCZGtYdFRGcGNORXo1SjhPZjU1ZFRIQVV1cVEx?=
 =?utf-8?B?enU2SmhCbTdGWE1nemE0SW5LVzJhSUtXb1NrOEFYNXFQV3JrMFJMelg3LzFU?=
 =?utf-8?B?RlFTNlRNclJkL3lBUTNyQ0xPZGQvejdDOGZBbFYzZklBNndIcDNFUm9yOS9U?=
 =?utf-8?B?Uk9YRkd6Q1VCQ0x4YkJocHFVNDVzZVdNcUZCU1A3TVJJSjVEZkNzMnZRYUwr?=
 =?utf-8?B?L0RVbi85RzNKT1krR1h2T2QvYWxub3d5SFo3N0s0Zmg1UWhDOGtqL2poRi9Z?=
 =?utf-8?B?eXBYa0JqNnYrdnVuVEtWMVE0MG84V0F5enhGK3MyZEVtUjVLa2Z6MHB2eno3?=
 =?utf-8?B?TFpTTFptM3o2eXhoUHNxR080em5GYVdMMHdCSmxRVG8vZURENnNhVW9tSUFR?=
 =?utf-8?B?YkV4YW55YlVCU2t0SHRNcDR4M0oxWFhlSlVJa1lSSjRIcW0rVTQ1ak1FWnMx?=
 =?utf-8?B?VHJoSzUvVEJkVm5QeDVXRldHWVdQWExQMkx5NTFXQkhLTkR6U0UreVVoWXBW?=
 =?utf-8?B?UC9hdWx2MFJqSlRUQU13dzI0QkwyMHpjNm9uT3ZQYmhycjdaVS9hQnNsRHly?=
 =?utf-8?B?V1hxY2V2QUtUMUxFSkdvSmN5U2gvU1RQbUQ2bndraUNIUStKMVh4N0lRbHdS?=
 =?utf-8?B?K0lCVkxRaU94MFhIWVBSYy9uR01qSDVkY3UycWhSMkh0cEk0VnZpRG15ZzZq?=
 =?utf-8?B?enR3cytlRGdYR2VpYkg0MWZKMis2RnZEa3daMzF2bE5IWnhWMnl0ajRubmpz?=
 =?utf-8?B?c3hBZjZ6RnhZanNsZnQyR3paZHV3bVRLOFAzMkRGeTQ4b2pheVI3cHpkbDZU?=
 =?utf-8?B?UndkTE5GZ3Q0cTRFZG1RRytOY3JkdUlXVk9uS09KV092ZTNVRjdRQ1hsR3dq?=
 =?utf-8?B?ZmJIY3h0WExlaitMUXNUUDhkSFdBaTNqSlZYNDJWVEdjWk9OTzdReStrcE1M?=
 =?utf-8?B?UFhXTXRMMlRVSGVEU280dmRJck5tTC9TSHkrY1hWMTBUSmZyU3Z0QnJ0cjRC?=
 =?utf-8?B?N1p1OFVlWnh2OVlUOW9sN3JxdmFHcFlvMTlOTms1UTBnRHRIUjZIV3ZLNE5r?=
 =?utf-8?B?Y0IzVGR0SE9nanByU2gxdElmRFR6eFJRcXRLMU52amFQM3FpZU1iaGJjZnVR?=
 =?utf-8?B?V2ZhaDI4YTFQUExLSTA5dFpCVXMxdW5lWEhvdXZ0ZXVvSFVPTWlKQStSbzlM?=
 =?utf-8?B?WG5xQUNzUEo3a2NCc1hJVGozQjBCcDhvMjFXVTVGazczekRURkdSVEhab0Z0?=
 =?utf-8?B?UFZIQzc1ZklUY0lscEJiczZnZXVTT0FtS1ZjenZaZDFzTFlueW16N0ZLSHpH?=
 =?utf-8?B?b2ozZ1JvYXQvWnFZUms1TVFWejJmek55VnhhOG5hQnRyYkVRUEF6RE1YOU9r?=
 =?utf-8?B?dEdmMEY3UThJd09ldE5TdG1iaTFCa1p2R281NHRvdjJURkNTaFpJT3gxazVS?=
 =?utf-8?B?V1ZhOGc3ZFg1a3ZGNSt3QVovaElBWGVFellVbDBodnc3cW5qNTlEblNjMjFR?=
 =?utf-8?B?c0J0VlhUaDNiWkF4OUdwKzJWSmVUdzRKTjRtejhUVEdDQnZoTFhBbXZxcUNM?=
 =?utf-8?B?d00zblc5ZHBuNStnelVqajZHOXZYWkdxNlpreTg3OWNQZDltNll2dmlTNEVv?=
 =?utf-8?Q?d8CBhH5/U8H2kTY6EMgKBtc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60a2d67-746f-4879-2221-08d9a84f4b2f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 15:47:56.8507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hblXi22SsH2UAvmqxpAuBsIUe4/J3jclstLDZVGkaVcKbKp8JsgmMVwmj7gZsxMJZCVLQflLQeG9bDmfErsSHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5813
X-Mailman-Approved-At: Mon, 15 Nov 2021 15:58:09 +0000
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 3/7] common: rename functions
 lcd_dt_simplefb to fdt_simplefb
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



On 15/11/2021 16:32, Patrick Delaunay wrote:
> Rename the function named lcd_dt_simplefb* to fdt_simplefb* to be aligned
> with the associated file name fdt_simplefb.h/fdt_simplefb.c
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
> 
>   board/raspberrypi/rpi/rpi.c |  2 +-
>   common/fdt_simplefb.c       | 10 +++++-----
>   include/fdt_simplefb.h      |  4 ++--
>   3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/board/raspberrypi/rpi/rpi.c b/board/raspberrypi/rpi/rpi.c
> index 55afaa54d9..cd7d6df2a5 100644
> --- a/board/raspberrypi/rpi/rpi.c
> +++ b/board/raspberrypi/rpi/rpi.c
> @@ -505,7 +505,7 @@ int ft_board_setup(void *blob, struct bd_info *bd)
>   
>   	node = fdt_node_offset_by_compatible(blob, -1, "simple-framebuffer");
>   	if (node < 0)
> -		lcd_dt_simplefb_add_node(blob);
> +		fdt_simplefb_add_node(blob);
>   
>   #ifdef CONFIG_EFI_LOADER
>   	/* Reserve the spin table */
> diff --git a/common/fdt_simplefb.c b/common/fdt_simplefb.c
> index 1650615cdb..32173030ab 100644
> --- a/common/fdt_simplefb.c
> +++ b/common/fdt_simplefb.c
> @@ -16,7 +16,7 @@
>   
>   DECLARE_GLOBAL_DATA_PTR;
>   
> -static int lcd_dt_simplefb_configure_node(void *blob, int off)
> +static int fdt_simplefb_configure_node(void *blob, int off)
>   {
>   	int xsize, ysize;
>   	int bpix; /* log2 of bits per pixel */
> @@ -58,7 +58,7 @@ static int lcd_dt_simplefb_configure_node(void *blob, int off)
>   				       xsize * (1 << bpix) / 8, name);
>   }
>   
> -int lcd_dt_simplefb_add_node(void *blob)
> +int fdt_simplefb_add_node(void *blob)
>   {
>   	static const char compat[] = "simple-framebuffer";
>   	static const char disabled[] = "disabled";
> @@ -76,10 +76,10 @@ int lcd_dt_simplefb_add_node(void *blob)
>   	if (ret < 0)
>   		return -1;
>   
> -	return lcd_dt_simplefb_configure_node(blob, off);
> +	return fdt_simplefb_configure_node(blob, off);
>   }
>   
> -int lcd_dt_simplefb_enable_existing_node(void *blob)
> +int fdt_simplefb_enable_existing_node(void *blob)
>   {
>   	int off;
>   
> @@ -87,5 +87,5 @@ int lcd_dt_simplefb_enable_existing_node(void *blob)
>   	if (off < 0)
>   		return -1;
>   
> -	return lcd_dt_simplefb_configure_node(blob, off);
> +	return fdt_simplefb_configure_node(blob, off);
>   }
> diff --git a/include/fdt_simplefb.h b/include/fdt_simplefb.h
> index 7cc305e1fd..7e54723591 100644
> --- a/include/fdt_simplefb.h
> +++ b/include/fdt_simplefb.h
> @@ -8,6 +8,6 @@
>   
>   #ifndef _FDT_SIMPLEFB_H_
>   #define _FDT_SIMPLEFB_H_
> -int lcd_dt_simplefb_add_node(void *blob);
> -int lcd_dt_simplefb_enable_existing_node(void *blob);
> +int fdt_simplefb_add_node(void *blob);
> +int fdt_simplefb_enable_existing_node(void *blob);
>   #endif
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
