Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B6D5EABC2
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 17:56:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3318CC5F1D3;
	Mon, 26 Sep 2022 15:56:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4FACC5EC6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:56:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QFUjcX025472;
 Mon, 26 Sep 2022 17:56:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RNVCpEnl0QSGJDeozZS3TTGoU7DSbItFDFys0NjKh7w=;
 b=NoPI2LD0Vw/KFk9G53bEZMM+5Ugrdm0Mi7tl4QVEwQXyq/ePWahJxZXf7rmnv+bZued8
 GbXXMoXWCFneDoXviWqd6X5m8KerDP/mkuZE03X5v7AsC3XqLZOtaMVKdqkm/GY1NwFW
 r3pFzkAuQ1C8tn7fq9U2cm3X2m5lESZwN8AifEm5v5n9heyRhqHxtP/XdfCkAxtlXyP+
 Xg7GcYEFvvyHzoJWfMkSmBwe7BLkUaHoDJgU2vfZXSz8pd6ws5w0R2MXurWSWvRxtaz8
 9rfuJgryZA8wDrhxEEvS06LWzi8bCsz9AKFO43NO4kue4bCyzZwC2hHA7fbs0FFhexjl kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsqam4117-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 17:56:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E09F710002A;
 Mon, 26 Sep 2022 17:56:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCC7D23BDFF;
 Mon, 26 Sep 2022 17:56:35 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 17:56:35 +0200
Message-ID: <ab5ae4fb-b651-91a9-23b1-1c4816e08796@foss.st.com>
Date: Mon, 26 Sep 2022 17:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-5-patrice.chotard@foss.st.com>
 <19cf1f5a-e6d1-1e44-3098-4847458a3b85@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <19cf1f5a-e6d1-1e44-3098-4847458a3b85@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/7] configs: stm32f746-disco: Fix
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
Pj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4+Cj4+IMKgIGNvbmZpZ3Mvc3RtMzJmNzQ2LWRpc2Nv
X3NwbF9kZWZjb25maWcgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9zdG0zMmY3NDYtZGlz
Y29fc3BsX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzJmNzQ2LWRpc2NvX3NwbF9kZWZjb25maWcK
Pj4gaW5kZXggNWU4YThhYWYzYy4uZDRhNjViZGUyNCAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9z
dG0zMmY3NDYtZGlzY29fc3BsX2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL3N0bTMyZjc0Ni1k
aXNjb19zcGxfZGVmY29uZmlnCj4+IEBAIC0zNiw3ICszNiw3IEBAIENPTkZJR19TUExfQk9BUkRf
SU5JVD15Cj4+IMKgIENPTkZJR19TUExfU1lTX01BTExPQ19TSU1QTEU9eQo+PiDCoCBDT05GSUdf
U1BMX01URF9TVVBQT1JUPXkKPj4gwqAgQ09ORklHX1NQTF9YSVBfU1VQUE9SVD15Cj4+IC1DT05G
SUdfU1lTX1NQTF9BUkdTX0FERFI9MHg4MWMwMDAwCj4+ICtDT05GSUdfU1lTX1NQTF9BUkdTX0FE
RFI9MHg4MGMwMDAwCj4+IMKgIENPTkZJR19TUExfRE1fUkVTRVQ9eQo+PiDCoCBDT05GSUdfU1lT
X1BCU0laRT0xMDUwCj4+IMKgIENPTkZJR19DTURfR1BUPXkKPiAKPiAKPiBSZXZpZXdlZC1ieTog
UGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFu
a3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL25leHQKClRoYW5rcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
