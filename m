Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6C338D27
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:34:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67749C57B55;
	Fri, 12 Mar 2021 12:34:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6007C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:34:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CCN8bI029586; Fri, 12 Mar 2021 13:34:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Eg6ahpvWDjKQ0sWJ9y6qIzRvBhvsCm3UrHOYezYIuUQ=;
 b=bhTI6lyRWnGp/ixkxBuf2yPMghsO0rYuZ2k4RmvAaXRyIk1nUNdu4roAalhMyo7KYzKe
 CnDaGtcKugnmugq+P8zHnmNF+2091dhh/7mohnI4xuH2Gpps/92N6vkEvF9Qfx15CB4D
 rlYkXRKBvTZDP2Hr8XO4Q8jTsKhdYBBXQ9jiLP3mrKrKHJhzQ93JILukfZDv9Lzl5t6L
 5E6CyB+BZUeQzyZI0EzQhqBcCcV7abmjScDlidkvPEjPvJpneJx/RSFlv8Lry0z8yuta
 bZ1OdtdQrkL/lYgvq2rF8MMw5R/Qw7cu3+scAXyS1AvHUfoYmIMAIzkTR0LWR22aKOyc bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf5u7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:34:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED89010002A;
 Fri, 12 Mar 2021 13:34:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4E6223DCD3;
 Fri, 12 Mar 2021 13:34:17 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:34:17 +0100
To: yannick Fertre <yannick.fertre@foss.st.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210304131413.1.I2cbb4b61852b8dd63bbad5b3a2a27857b59be7ab@changeid>
 <20210304131413.2.I6bd3d4c022837f70b36d4fc91b31ae6e9f367c05@changeid>
 <bc879b20-a474-d249-8910-e231deb194ef@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <08aa4a12-96f5-2b1c-8d78-bccfee019226@foss.st.com>
Date: Fri, 12 Mar 2021 13:34:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bc879b20-a474-d249-8910-e231deb194ef@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] video: dw_mipi_dsi: update log of
	dphy_enable
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

SGkKCk9uIDMvNC8yMSA0OjAwIFBNLCB5YW5uaWNrIEZlcnRyZSB3cm90ZToKPiBBY2tlZC1ieTog
WWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgo+IAo+IAo+IE9uIDMv
NC8yMSAxOjE0IFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBGcm9tOiBZYW5uaWNrIEZl
cnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4+Cj4+IFRoZSBEU0kgcGh5IGNhbiBi
ZSB0dXJuZWQgb24gZnJvbSB0aGUgRFNJIGRpZ2l0YWwgaW50ZXJmYWNlIGluCj4+IHRoZSBkcGh5
X2VuYWJsZSgpIGZ1bmN0aW9uIG9yIGZyb20gYSBkZWRpY2F0ZWQgRFNJIHBoeSAid3JhcHBlciIK
Pj4gaW4gcGh5X29wcy0+aW5pdCgpIGZ1bmN0aW9uLiBJZiB0aGUgU1RNMzJNUDEgY2FzZSwgdGhl
IHdyYXBwZXIKPj4gaXMgdXNlZCB0aGVuIHRoZSBkcGh5X2VuYWJsZSgpICJ3YXJuaW5nIiB0cmFj
ZXMgYXJlIG5vdCByZWxldmFudC4KPj4KPj4gVGhpcyBwYXRjaCBtb3ZlcyB0aGVzZSAid2Fybmlu
ZyIgdHJhY2VzIHRvICJkZWJ1ZyIgdHJhY2VzIHNvCj4+IHRoZXkgYXJlIHN0aWxsIGF2YWlsYWJs
ZSBmb3IgRFNJIHBoeSBiYXNlZCBvbiB0aGUgZGlnaXRhbAo+PiBpbnRlcmZhY2UgaW4gZGVidWcg
bG9nZ2luZyBtb2RlLCBidXQgbm90IHRoZXJlIGluIG5vcm1hbCBtb2RlCj4+IGZvciBib3RoIGNh
c2VzLgo+PiBOb3RlOiBUaGUgcmVsYXRlZCBMaW51eCBrZXJuZWwgZHJpdmVyIHVzZXMgYSAiZGVi
dWciCj4+IG1lc3NhZ2UgdG9vLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8
eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBkcml2
ZXJzL3ZpZGVvL2R3X21pcGlfZHNpLmMgfCA4ICsrKystLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2R3X21pcGlfZHNpLmMgYi9kcml2ZXJzL3ZpZGVvL2R3X21pcGlfZHNpLmMKPj4g
aW5kZXggYTViZWVkMzUxNC4uOWFlMDllZWMxMiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aWRl
by9kd19taXBpX2RzaS5jCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZHdfbWlwaV9kc2kuYwo+PiBA
QCAtNzIxLDE1ICs3MjEsMTUgQEAgc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfZHBoeV9lbmFibGUo
c3RydWN0IGR3X21pcGlfZHNpICpkc2kpCj4+IMKgwqDCoMKgwqAgcmV0ID0gcmVhZGxfcG9sbF90
aW1lb3V0KGRzaS0+YmFzZSArIERTSV9QSFlfU1RBVFVTLCB2YWwsCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWwgJiBQSFlfTE9DSywgUEhZX1NUQVRVU19USU1FT1VU
X1VTKTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0KQo+PiAtwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4o
ZHNpLT5kc2lfaG9zdC5kZXYsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImZhaWxlZCB0
byB3YWl0IHBoeSBsb2NrIHN0YXRlXG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9kYmcoZHNp
LT5kc2lfaG9zdC5kZXYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJmYWlsZWQgdG8gd2Fp
dCBwaHkgbG9jayBzdGF0ZVxuIik7Cj4+IMKgIMKgwqDCoMKgwqAgcmV0ID0gcmVhZGxfcG9sbF90
aW1lb3V0KGRzaS0+YmFzZSArIERTSV9QSFlfU1RBVFVTLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdmFsLCB2YWwgJiBQSFlfU1RPUF9TVEFURV9DTEtfTEFORSwKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBIWV9TVEFUVVNfVElNRU9VVF9V
Uyk7Cj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gLcKgwqDCoMKgwqDCoMKgIGRldl93YXJuKGRz
aS0+ZHNpX2hvc3QuZGV2LAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJmYWlsZWQgdG8g
d2FpdCBwaHkgY2xrIGxhbmUgc3RvcCBzdGF0ZVxuIik7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZf
ZGJnKGRzaS0+ZHNpX2hvc3QuZGV2LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZmFpbGVk
IHRvIHdhaXQgcGh5IGNsayBsYW5lIHN0b3Agc3RhdGVcbiIpOwo+PiDCoCB9Cj4+IMKgIMKgIHN0
YXRpYyB2b2lkIGR3X21pcGlfZHNpX2NsZWFyX2VycihzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSkK
Pj4KQXBwbGllZCB0byB1LWJvb3Qtc3RtL25leHQKClRoYW5rcwoKUGF0cmljZQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
