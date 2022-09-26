Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 754CB5EABC3
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 17:56:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CBDAC5F1ED;
	Mon, 26 Sep 2022 15:56:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEEDCC5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:56:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QFNkvY008459;
 Mon, 26 Sep 2022 17:56:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2ssosjvFTEit3PWRtQmhDTtrDygksvuhwGiqGi77cWQ=;
 b=Asbht2zbrojlhf6SCL3nFd5rR7BTtibbjLSOmgOWmKDbICIE0dzvWAJWHw7lCZ9KRtxq
 eEbZ54eHRSilxz0hc1BxydbG4rKZ/bdUivnnfUQ79UVsZwluvGqcmhz3hkxFnMLqcqkn
 zT/x+4TQgp1HZBt3ceqr+SXM43nff9id7WbrI7j7VSZM57y5+/31fniUQ1arZgg5fveh
 1QG9jVYx9WzT2L1xzCuKbz52D/9Z67PqcPjuPvZhQJhRyQSk5PDS560CdH/nIweN7OK6
 gn4/aPnfyQimOlJPsvua8sngj8d7P/vq76PSZhGeSslRDpZHhI5QANJsYEr45bA3+HX5 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjcgac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 17:56:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B9D2A100034;
 Mon, 26 Sep 2022 17:56:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B66E423BDFF;
 Mon, 26 Sep 2022 17:56:41 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 17:56:41 +0200
Message-ID: <45a6c4f6-8a60-fe9c-e9ac-8e241483650e@foss.st.com>
Date: Mon, 26 Sep 2022 17:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-6-patrice.chotard@foss.st.com>
 <6e193abd-0707-ad5e-2ff6-8c19ab17306e@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <6e193abd-0707-ad5e-2ff6-8c19ab17306e@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/7] configs: stm32746g-eval: Fix
 CONFIG_SYS_SPL_ARGS_ADDR
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA5LzI2LzIyIDE0OjU4LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDkvMjAvMjIgMTg6MDQsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gU1RNMzJGNzQ2IGVtYmVk
cyAxIE1CIG9mIGludGVybmFsIGZsYXNoIFsweDA4MDAwMDAwLTB4MDgwZmZmZmZdLAo+PiBmaXgg
Q09ORklHX1NZU19TUExfQVJHU19BRERSIGFjY29yZGluZ2x5Cj4+IEl0IHNvbHZlcyBoYXJkIGZh
dWx0IHdoZW4ganVtcGluZyBmcm9tIFNQTCB0byBVLUJvb3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4K
Pj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4+Cj4+IMKgIGNvbmZpZ3Mvc3RtMzI3NDZnLWV2YWxf
c3BsX2RlZmNvbmZpZyB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMyNzQ2Zy1ldmFs
X3NwbF9kZWZjb25maWcgYi9jb25maWdzL3N0bTMyNzQ2Zy1ldmFsX3NwbF9kZWZjb25maWcKPj4g
aW5kZXggZDhkNTVjMmQzYy4uMjhmNTIyYjE1ZSAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9zdG0z
Mjc0NmctZXZhbF9zcGxfZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvc3RtMzI3NDZnLWV2YWxf
c3BsX2RlZmNvbmZpZwo+PiBAQCAtMzYsNyArMzYsNyBAQCBDT05GSUdfU1BMX0JPQVJEX0lOSVQ9
eQo+PiDCoCBDT05GSUdfU1BMX1NZU19NQUxMT0NfU0lNUExFPXkKPj4gwqAgQ09ORklHX1NQTF9N
VERfU1VQUE9SVD15Cj4+IMKgIENPTkZJR19TUExfWElQX1NVUFBPUlQ9eQo+PiAtQ09ORklHX1NZ
U19TUExfQVJHU19BRERSPTB4ODFjMDAwMAo+PiArQ09ORklHX1NZU19TUExfQVJHU19BRERSPTB4
ODBjMDAwMAo+PiDCoCBDT05GSUdfU1BMX0RNX1JFU0VUPXkKPj4gwqAgQ09ORklHX1NZU19QQlNJ
WkU9MTA1MAo+PiDCoCBDT05GSUdfQ01EX0dQVD15Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4g
UGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9uZXh0CgpUaGFua3MKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
